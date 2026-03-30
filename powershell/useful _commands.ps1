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
py python/azure_auth_test.py