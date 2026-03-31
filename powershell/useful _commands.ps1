# IAM Labs - Useful Azure CLI & Python Commands
# This file is your "Cheat Sheet" for local development and IAM experiments.

# --- 1. IDENTITY & LOGIN (AuthN) ---

# Login to a specific tenant (use this if you have multiple directories)
az login --tenant "<your-tenant-id>"

# Check who you are currently logged in as
az account show --output table

# List all subscriptions you have access to
az account list --output table

# Set the active subscription if you have more than one
az account set --subscription "<your-subscription-id>"

# Logout (clear local session)
az logout


# --- 2. SERVICE PRINCIPALS & RBAC (Least Privilege) ---

# Create a Service Principal for automated scripts (like we did today)
# Scope: Only the Resource Group RG-IAM-LABS
az ad sp create-for-rbac --name "SPN-IAM-LABS-BOT" --role Contributor --scopes "/subscriptions/<your-subscription-id>/resourceGroups/RG-IAM-LABS"

# List your Application Registrations
az ad app list --display-name "SPN-IAM-LABS-BOT" --output table

# Verify Role Assignment (Audit/Ground Truth)
# Use this to see who has what role in your resource group
az role assignment list --resource-group RG-IAM-LABS --output table


# --- 3. RESOURCE MANAGEMENT ---

# List all resource groups in the subscription
az group list --output table

# List all resources within a specific group (e.g., your lab resources)
az resource list --resource-group RG-IAM-LABS --output table


# --- 4. PYTHON & DEPENDENCIES ---

# Install required libraries from requirements.txt (using the 'py' launcher for Windows)
py -m pip install -r python/requirements.txt

# Run the authentication test script
# (On Mac use python3, on Windows use py)
python3 python/azure_auth_test.py


# --- 5. LAB AUTOMATION SCRIPTS ---

# List resources in RG-IAM-LABS using the Bot's identity
python3 python/list_resources.py

# Run the IAM Smoke Test (Isolation & Tagging verification)
python3 python/smoke_test.py


# --- 6. AUDIT & VERIFICATION (CLI) ---

# Check if the tag was correctly applied by the bot
az resource list --tag Environment=Lab --output table

# View the Audit Trail - see what the bot actually did in the portal
az monitor activity-log list --resource-group RG-IAM-LABS --output table