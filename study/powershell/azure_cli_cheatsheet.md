# 📘 Azure CLI Cheat Sheet - IAM Labs

This cheat sheet contains essential Azure CLI commands used for resource management, auditing, and cleanup during our labs.

## 🔑 Authentication & Account
| Command | Description |
| :--- | :--- |
| `az login` | Interactive login via browser. Use this to start your session. |
| `az logout` | Logs out the current user. |
| `az account show` | Shows details of the currently active subscription and user. |
| `az account list --output table` | Lists all subscriptions your account has access to. |

## 🔍 Visibility & Enumeration (Audit)
| Command | Description |
| :--- | :--- |
| `az resource list --output table` | Lists ALL resources in the current subscription. |
| `az resource list --resource-group <RG> --output table` | Lists resources within a specific Resource Group. |
| `az vm list --output table` | Lists all Virtual Machines. |
| `az network vnet list --output table` | Lists all Virtual Networks. |

## 🔐 IAM & Access Control (Least Privilege)
Best practices for managing access without using the root/main account.

### Create a new Entra ID (Azure AD) User
```powershell
# Create user (password must meet complexity requirements)
az ad user create --display-name "Lab-Admin" --password "<STRONG_PASSWORD>" --user-principal-name "lab-admin@<YOUR_DOMAIN>.onmicrosoft.com"
```

### Assign RBAC Role to a Resource Group (Scope)
Instead of giving permissions to the whole subscription, limit the user to one Resource Group.
```powershell
# Assign 'Contributor' role to the user, scoped only to our RG
az role assignment create --assignee "lab-admin@<YOUR_DOMAIN>.onmicrosoft.com" --role "Contributor" --scope "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RG_NAME>"
```

### Create a Service Principal (for automation/scripts)
If you want a "bot" to manage resources instead of a human user:
```powershell
az ad sp create-for-rbac --name "sp-iam-labs-bot" --role "Contributor" --scopes "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RG_NAME>"
```

### Assign Role to a SPECIFIC Resource (Granular Access)
Use this if you want to give someone access to only ONE VM, instead of the whole group.
```powershell
# 1. Get the Resource ID of the specific VM
$VM_ID=$(az vm show --name <VM_NAME> --resource-group <RG_NAME> --query id --output tsv)

# 2. Assign role scoped ONLY to that VM
az role assignment create --assignee "wife@<YOUR_DOMAIN>.com" --role "Virtual Machine Contributor" --scope $VM_ID
```

### Delegated Administration (User Access Administrator)
To allow a user to manage permissions for others (like your wife) within a specific scope, but without making them an 'Owner'.
```powershell
# This user can now assign roles to others within this Resource Group
az role assignment create --assignee "lab-admin@<YOUR_DOMAIN>.onmicrosoft.com" --role "User Access Administrator" --scope "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RG_NAME>"
```

> [!TIP]
> **Advanced IAM Concept:** In professional environments, we use **Azure ABAC** to add *Conditions* to the `User Access Administrator` role, so they can only assign specific "lower" roles (e.g., they can assign `Reader` but not `Owner`).

### Dynamic IP Lockdown (Security Automation)
Use this PowerShell snippet to automatically detect your current public IP and update an NSG rule to allow access only from your location.
```powershell
# 1. Get current public IP
$MyIP = Invoke-RestMethod -Uri "https://api.ipify.org"
Write-Host "Detected your public IP: $MyIP"

# 2. Update NSG rule to allow ONLY this IP
az network nsg rule update --name AllowSSH --nsg-name <NSG_NAME> --resource-group <RG_NAME> --source-address-prefixes $MyIP
```

## 🏗️ Infrastructure Deployment (Creation)
Essential commands for setting up new laboratory environments.

### Resource Group
```powershell
az group create --name <RG_NAME> --location <LOCATION> # e.g., polandcentral
```

### Networking (VNet & Subnet)
```powershell
# Create VNet and a default subnet in one go
az network vnet create --name <VNET_NAME> --resource-group <RG_NAME> --address-prefix 10.0.0.0/16 --subnet-name <SUBNET_NAME> --subnet-prefix 10.0.1.0/24
```

### Network Security (NSG)
```powershell
# Create NSG
az network nsg create --name <NSG_NAME> --resource-group <RG_NAME>

# Create an Inbound Rule (e.g., Allow SSH)
az network nsg rule create --name AllowSSH --resource-group <RG_NAME> --nsg-name <NSG_NAME> --priority 1000 --destination-port-ranges 22 --access Allow --protocol Tcp
```

### Virtual Machines (Secure Creation Flow)
Best practice: Detect your IP first, then apply it during creation.
```powershell
# 1. Get current IP
$MyIP = Invoke-RestMethod -Uri "https://api.ipify.org"

# 2. Create NSG
az network nsg create --name <NSG_NAME> --resource-group <RG_NAME>

# 3. Create SSH rule allowed ONLY for your current IP
az network nsg rule create --name AllowSSH --resource-group <RG_NAME> --nsg-name <NSG_NAME> --priority 1000 --destination-port-ranges 22 --access Allow --protocol Tcp --source-address-prefixes $MyIP

# 4. Create VM using the pre-configured NSG
az vm create --resource-group <RG_NAME> --name <VM_NAME> --image Ubuntu2204 --admin-username azureuser --generate-ssh-keys --vnet-name <VNET_NAME> --subnet <SUBNET_NAME> --nsg <NSG_NAME>
```

## 🧹 Cloud Hygiene (Cleanup)
**Important:** Most delete commands are permanent. Use with caution.

### Virtual Machines
```powershell
# Delete a VM (often deletes the OS disk if --yes is used, but check anyway)
az vm delete --name <VM_NAME> --resource-group <RG_NAME> --yes
```

### Network Components (Must be deleted in order)
If a resource is in use (e.g., a VNet used by a VM), it cannot be deleted until the dependency is removed.

1. **Network Interface (NIC):** `az network nic delete --name <NIC_NAME> --resource-group <RG_NAME>`
2. **Public IP:** `az network public-ip delete --name <IP_NAME> --resource-group <RG_NAME>`
3. **Security Group (NSG):** `az network nsg delete --name <NSG_NAME> --resource-group <RG_NAME>`
4. **Virtual Network (VNet):** `az network vnet delete --name <VNET_NAME> --resource-group <RG_NAME>`

### Generic Resource Deletion
If you have the unique Resource ID:
```powershell
az resource delete --ids <RESOURCE_ID>
```

## 💡 Pro-Tips
- **Output Formats:** Use `--output table` for readability, or `--output json` if you need details for a script.
- **Querying:** Use `--query "[].name"` to filter specific fields (uses JMESPath).
- **Cleanup Check:** Always run `az resource list` after a cleanup to ensure no "orphaned" disks or IPs are left behind.

## 🚀 Smart Connectivity Script (Pro-Tip)
Combine all steps into one "Start Lab" script to handle login, IP check, and SSH connection.

```powershell
# start-lab.ps1 logic:
$MyIP = Invoke-RestMethod -Uri "https://api.ipify.org"

# 1. Check if logged in, if not - login
az account show --output none
if ($LASTEXITCODE -ne 0) { az login }

# 2. Get current IP from the NSG rule
$CurrentRuleIP = az network nsg rule show --name AllowSSH --nsg-name <NSG_NAME> --resource-group <RG_NAME> --query sourceAddressPrefix --output tsv

# 3. Update only if changed
if ($MyIP -ne $CurrentRuleIP) {
    Write-Host "IP changed from $CurrentRuleIP to $MyIP. Updating NSG..."
    az network nsg rule update --name AllowSSH --nsg-name <NSG_NAME> --resource-group <RG_NAME> --source-address-prefixes $MyIP
} else {
    Write-Host "IP is still $MyIP. No update needed."
}

# 4. Connect to VM
ssh azureuser@<VM_PUBLIC_IP>
```
