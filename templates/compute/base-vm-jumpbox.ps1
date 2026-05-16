# 🧩 Template: Jumpbox VM Deployment
# Usage: ./templates/compute/base-vm-jumpbox.ps1 -VM_NAME "my-vm" -RG_NAME "my-rg"

param (
    [string]$RG_NAME = "rg-iam-labs",
    [string]$LOCATION = "polandcentral",
    [string]$VM_NAME = "vm-jumpbox",
    [string]$VNET_NAME = "vnet-iam-labs",
    [string]$SUBNET_NAME = "snet-public",
    [string]$NSG_NAME = "nsg-iam-labs",
    [string]$VM_IMAGE = "Ubuntu2204",
    [string]$ADMIN_USER = "azureuser"
)

Write-Host "--- Template: Deploying VM ($VM_NAME) ---" -ForegroundColor Cyan
Write-Host "Note: This may take a few minutes." -ForegroundColor Gray

az vm create `
    --resource-group $RG_NAME `
    --name $VM_NAME `
    --location $LOCATION `
    --image $VM_IMAGE `
    --admin-username $ADMIN_USER `
    --generate-ssh-keys `
    --vnet-name $VNET_NAME `
    --subnet $SUBNET_NAME `
    --nsg $NSG_NAME `
    --public-ip-address-allocation static `
    --output table

$VM_IP = az vm show -d -g $RG_NAME -n $VM_NAME --query publicIps -o tsv
Write-Host "VM deployed successfully at $VM_IP" -ForegroundColor Green
Write-Host "Connection command: ssh $ADMIN_USER@$VM_IP" -ForegroundColor Green
