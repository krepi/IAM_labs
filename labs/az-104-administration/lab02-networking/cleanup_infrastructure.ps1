# 🧹 Lab 02: Infrastructure Cleanup Script
# This script removes all resources from Lab 02 while keeping the Resource Group.

$RG_NAME = "rg-iam-labs"
$VM_NAME = "vm-jumpbox"
$VNET_NAME = "vnet-iam-labs"
$NSG_NAME = "nsg-iam-labs"

Write-Host "`n--- Starting Infrastructure Cleanup ---" -ForegroundColor Cyan

# 0. Fetch IDs before starting deletion (important for dependencies)
$NIC_ID = az vm show -g $RG_NAME -n $VM_NAME --query "networkProfile.networkInterfaces[0].id" -o tsv 2>$null
$DISK_IDS = az disk list --resource-group $RG_NAME --query "[?contains(name, '$VM_NAME')].id" -o tsv 2>$null

# 1. Delete Virtual Machine (and wait)
Write-Host "Step 1: Deleting Virtual Machine ($VM_NAME)..." -ForegroundColor Yellow
az vm delete --name $VM_NAME --resource-group $RG_NAME --yes

# 2. Delete Networking Components
Write-Host "Step 2: Cleaning up Networking and Security..." -ForegroundColor Yellow

# Delete NIC
if ($NIC_ID) {
    az network nic delete --ids $NIC_ID
}

# Delete Public IP
az network public-ip delete --name "$VM_NAME-ip" --resource-group $RG_NAME

# Delete NSG
az network nsg delete --name $NSG_NAME --resource-group $RG_NAME

# Delete VNet
az network vnet delete --name $VNET_NAME --resource-group $RG_NAME

# 3. Cleanup Disks and SSH Keys
Write-Host "Step 3: Cleaning up orphaned Disks and SSH Keys..." -ForegroundColor Yellow

# Use the pre-fetched DISK_IDS
if ($DISK_IDS) {
    foreach ($id in $DISK_IDS) {
        az resource delete --ids $id
    }
}

# Delete SSH Public Key resource without confirmation
az sshkey delete --name "$VM_NAME" --resource-group $RG_NAME --yes 2>$null
az sshkey delete --name "$VM_NAME-key" --resource-group $RG_NAME --yes 2>$null
az sshkey delete --name "${VM_NAME}_key" --resource-group $RG_NAME --yes 2>$null

Write-Host "--- Cleanup Complete! Resource Group '$RG_NAME' is now empty. ---" -ForegroundColor Cyan
