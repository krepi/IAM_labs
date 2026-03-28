import os
from dotenv import load_dotenv
from azure.identity import ClientSecretCredential

# Load environment variables from the .env file
load_dotenv()

def main():
    print("--------------------------------------------------")
    print("Azure IAM Labs - Initial Authentication Test")
    print("--------------------------------------------------")
    
    # Retrieve credentials securely from the environment
    tenant_id = os.getenv("AZURE_TENANT_ID")
    client_id = os.getenv("AZURE_CLIENT_ID")
    client_secret = os.getenv("AZURE_CLIENT_SECRET")
    
    if not all([tenant_id, client_id, client_secret]):
        print("[!] Error: Missing required Azure credentials in .env file.")
        print("    Please ensure AZURE_TENANT_ID, AZURE_CLIENT_ID, and AZURE_CLIENT_SECRET are set.")
        return

    try:
        # Initialize the credential object using Azure Identity
        print("[*] Attempting to authenticate with Azure Entra ID...")
        credential = ClientSecretCredential(
            tenant_id=tenant_id,
            client_id=client_id,
            client_secret=client_secret
        )
        
        # We request a token for the Microsoft Graph API to verify credentials are valid
        # .default scope means we are requesting permissions configured on the App Registration
        token = credential.get_token("https://graph.microsoft.com/.default")
        
        print("[+] Success! Authentication verified.")
        print(f"[+] Token acquired successfully (starts with: {token.token[:10]}...)")
        
    except Exception as e:
        print("[-] Authentication failed.")
        print(f"[-] Details: {str(e)}")

if __name__ == "__main__":
    main()
