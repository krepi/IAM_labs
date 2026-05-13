import os
from datetime import datetime, timedelta, timezone
from dotenv import load_dotenv
from azure.identity import ClientSecretCredential
from azure.monitor.query import LogsQueryClient, LogsQueryStatus
from azure.mgmt.monitor import MonitorManagementClient

# Load environment variables
load_dotenv()

def query_with_monitor_mgmt(credential, subscription_id, resource_group):
    """
    Fallback method to query Activity Logs directly from the subscription 
    if no Log Analytics Workspace is available.
    Ideal for Tracking 'Smoke Tests' (Control Plane).
    """
    client = MonitorManagementClient(credential, subscription_id)
    
    # Define timeframe for smoke tests (last 1 hour)
    # Using modern timezone-aware datetime for UTC
    start_time = datetime.now(timezone.utc) - timedelta(hours=1)
    end_time = datetime.now(timezone.utc)
    
    # Full subscription search for the last hour to catch 'loud' forbidden attempts
    filter_query = f"eventTimestamp ge '{start_time.isoformat()}' and eventTimestamp le '{end_time.isoformat()}'"
    
    print(f"[*] Querying Subscription Activity Logs for ALL movements across subscription...")
    
    events = client.activity_logs.list(filter=filter_query)
    
    count = 0
    print(f"{'TIME':<25} {'OPERATION':<50} {'STATUS':<20} {'ACTOR':<30}")
    print("-" * 125)
    
    for event in events:
        count += 1
        time_str = event.event_timestamp.strftime('%Y-%m-%d %H:%M:%S')
        operation = event.operation_name.localized_value if event.operation_name else "N/A"
        status = event.status.localized_value if event.status else "N/A"
        actor = event.caller if event.caller else "N/A"
        
        print(f"{time_str:<25} {operation:<50} {status:<20} {actor:<30}")
    
    if count == 0:
        print("[+] No identity activity found in the last hour for this group.")
        print("[!] Note: Azure Activity Logs can have a propagation delay of 1-5 minutes.")

def main():
    # Configuration from .env
    subscription_id = os.getenv("AZURE_SUBSCRIPTION_ID")
    tenant_id = os.getenv("AZURE_TENANT_ID")
    client_id = os.getenv("AZURE_CLIENT_ID")
    client_secret = os.getenv("AZURE_CLIENT_SECRET")
    workspace_id = os.getenv("AZURE_LOG_ANALYTICS_WORKSPACE_ID") # New expected variable
    resource_group = "RG-IAM-LABS"

    print(f"--------------------------------------------------")
    print(f"Azure IAM Labs - Audit & Smoke Test Tracker")
    print(f"Target Group: {resource_group}")
    print(f"--------------------------------------------------")

    if not all([subscription_id, tenant_id, client_id, client_secret]):
        print("[!] Error: Missing required Azure credentials in .env file.")
        return

    try:
        # 1. Authenticate
        credential = ClientSecretCredential(
            tenant_id=tenant_id,
            client_id=client_id,
            client_secret=client_secret
        )

        # 2. Check if we should use KQL (Workspace) or Direct Management API
        if workspace_id:
            print(f"[*] Workspace ID found. Using LogsQueryClient (KQL Mode)...")
            query_client = LogsQueryClient(credential)
            
            # KQL targeting Data Plane (requires Diagnostic Settings)
            kql_query = f"""
            AzureActivity
            | where ResourceGroup == "{resource_group}"
            | project TimeGenerated, OperationName, Resource, Caller, ActivityStatusValue
            | order by TimeGenerated desc
            """
            
            response = query_client.query_workspace(
                workspace_id=workspace_id,
                query=kql_query,
                timespan=timedelta(hours=24)
            )

            if response.status == LogsQueryStatus.SUCCESS:
                table = response.tables[0]
                if not table.rows:
                    print("[+] No workspace logs found. Checking Activity Logs instead...")
                    query_with_monitor_mgmt(credential, subscription_id, resource_group)
                else:
                    print(f"{'TIME':<25} {'OPERATION':<50} {'RESULT':<20}")
                    for row in table.rows:
                        print(f"{str(row[0]):<25} {str(row[1]):<50} {str(row[4]):<20}")
            else:
                print(f"[-] KQL Query failed: {response.error}")
        else:
            # 3. Fallback to Subscription-level Activity Logs
            print("[!] No Workspace ID provided. Auditing SPN movements across subscription...")
            query_with_monitor_mgmt(credential, subscription_id, resource_group)

    except Exception as e:
        print(f"[-] Error occurred: {str(e)}")

if __name__ == "__main__":
    main()
