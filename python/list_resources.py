import os
from dotenv import load_dotenv
from azure.identity import ClientSecretCredential
from azure.mgmt.resource import ResourceManagementClient

# Load environment variables
load_dotenv()

def main():
    # Configuration from .env
    subscription_id = os.getenv("AZURE_SUBSCRIPTION_ID")
    tenant_id = os.getenv("AZURE_TENANT_ID")
    client_id = os.getenv("AZURE_CLIENT_ID")
    client_secret = os.getenv("AZURE_CLIENT_SECRET")
    resource_group = "RG-IAM-LABS"

    print(f"--------------------------------------------------")
    print(f"Azure IAM Labs - Resource Listing (SPN Mode)")
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

        # 2. Initialize the Resource Management Client
        client = ResourceManagementClient(credential, subscription_id)

        # 3. List resources in the group
        print(f"[*] Fetching resources from {resource_group}...")
        resources = client.resources.list_by_resource_group(resource_group)

        # 4. Display results in a table-like format
        print(f"{'NAME':<40} {'TYPE':<40} {'LOCATION':<20} {'STATUS':<15}")
        print("-" * 115)
        
        count = 0
        for item in resources:
            name = item.name or "N/A"
            resource_type = item.type or "N/A"
            location = item.location or "Global"
            status = getattr(item, 'provisioning_state', 'Unknown') or "N/A"
            
            print(f"{name:<40} {resource_type:<40} {location:<20} {status:<15}")
            count += 1
        
        print("-" * 115)
        print(f"[+] Total resources found: {count}")

    except Exception as e:
        print(f"[-] Error occurred: {str(e)}")

if __name__ == "__main__":
    main()
