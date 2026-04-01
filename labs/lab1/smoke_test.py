import os
from dotenv import load_dotenv
from azure.identity import ClientSecretCredential
from azure.mgmt.resource import ResourceManagementClient
from azure.core.exceptions import HttpResponseError

# Load environment variables
load_dotenv()

def main():
    subscription_id = os.getenv("AZURE_SUBSCRIPTION_ID")
    tenant_id = os.getenv("AZURE_TENANT_ID")
    client_id = os.getenv("AZURE_CLIENT_ID")
    client_secret = os.getenv("AZURE_CLIENT_SECRET")
    
    # Lab Resource Group (Bot has access)
    lab_rg = "RG-IAM-LABS"
    # Forbidden Resource Group (Bot SHOULD NOT have access)
    forbidden_rg = "NetworkWatcherRG"
    
    print("-" * 60)
    print("IAM SMOKE TEST: Least Privilege Verification")
    print("-" * 60)

    try:
        credential = ClientSecretCredential(
            tenant_id=tenant_id,
            client_id=client_id,
            client_secret=client_secret
        )
        client = ResourceManagementClient(credential, subscription_id)

        # --- PHASE 1: TEST ISOLATION (FORBIDDEN) ---
        print(f"\n[*] PHASE 1: Testing isolation by LOUDLY accessing {forbidden_rg}...")
        try:
            # Attempt a "Mutating" action (Update tags on a forbidden group)
            # This SHOULD be logged as a "Failed" event in Activity Logs.
            print(f"[*] Attempting to update tags on FORBIDDEN {forbidden_rg}...")
            client.resource_groups.update(
                forbidden_rg,
                {"tags": {"UnauthorizedCodeInjection": "True"}}
            )
            print("[!] CRITICAL ERROR: Access should have been denied but it wasn't!")
        except Exception as e:
            if "AuthorizationFailed" in str(e) or "403" in str(e):
                print(f"[+] SUCCESS: Isolation verified. LOUD access to {forbidden_rg} is DENIED.")
            else:
                print(f"[-] Phase 1 unexpected failure: {str(e)}")

        # --- PHASE 2: TEST OPERATION (ALLOWED - TAGGING) ---
        print(f"\n[*] PHASE 2: Testing operational access (Tagging) in {lab_rg}...")
        # We need the full resource ID for tagging. We'll find the VNET by name.
        resources = client.resources.list_by_resource_group(lab_rg)
        vnet = next((r for r in resources if "vnet" in r.name.lower()), None)
        
        if vnet:
            print(f"[*] Found target resource: {vnet.name}")
            print(f"[*] Updating tags: {{'Environment': 'Lab', 'ManagedBy': 'SPN-BOT'}}...")
            
            # Update tags on the resource
            # api_version should be compatible with the resource type
            new_tags = {"Environment": "Lab", "ManagedBy": "SPN-BOT"}
            update_poller = client.resources.begin_update_by_id(
                resource_id=vnet.id,
                api_version="2021-04-01",
                parameters={"tags": new_tags}
            )
            updated_resource = update_poller.result()
            print(f"[+] SUCCESS: Tags updated successfully on {vnet.name}.")
            print(f"[+] Current Tags: {updated_resource.tags}")
        else:
            print(f"[-] Error: Could not find a VNET in {lab_rg} to test tagging.")

    except Exception as e:
        print(f"[-] SMOKE TEST FAILED: {str(e)}")

if __name__ == "__main__":
    main()
