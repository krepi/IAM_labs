# 📜 Lab 02: Infrastructure as Code (Azure CLI + PowerShell)
# This script automates the deployment of the network architecture documented in MANUAL_PORTAL.md

# --- 1. VARIABLES ---
$RG_NAME = "rg-iam-labs"
$LOCATION = "polandcentral"
$VNET_NAME = "vnet-iam-labs"
$VNET_PREFIX = "10.0.0.0/16"
$SNET_PUBLIC_NAME = "snet-public"
$SNET_PUBLIC_PREFIX = "10.0.0.0/24"
$SNET_PRIVATE_NAME = "snet-private"
$SNET_PRIVATE_PREFIX = "10.0.1.0/24"
$NSG_NAME = "nsg-iam-labs"
$VM_NAME = "vm-jumpbox"
$VM_IMAGE = "Ubuntu2204"
$ADMIN_USER = "azureuser"

# --- 2. ENVIRONMENT CHECK ---
Write-Host "--- Starting Infrastructure Deployment ---" -ForegroundColor Cyan

# Detect public IP
$MyIP = Invoke-RestMethod -Uri "https://api.ipify.org"
Write-Host "Detected your public IP: $MyIP" -ForegroundColor Yellow

# Check Azure Login
az account show --output none
if ($LASTEXITCODE -ne 0) {
    Write-Host "You are not logged in. Please log in to Azure." -ForegroundColor Red
    az login
}

# --- 3. RESOURCE GROUP ---
Write-Host "Step 1: Creating Resource Group..." -ForegroundColor Green
az group create --name $RG_NAME --location $LOCATION --output table

# --- 4. NETWORKING ---
Write-Host "Step 2: Creating Virtual Network and Public Subnet..." -ForegroundColor Green
az network vnet create `
    --name $VNET_NAME `
    --resource-group $RG_NAME `
    --location $LOCATION `
    --address-prefix $VNET_PREFIX `
    --subnet-name $SNET_PUBLIC_NAME `
    --subnet-prefix $SNET_PUBLIC_PREFIX `
    --output table

Write-Host "Step 3: Creating Private Subnet..." -ForegroundColor Green
az network vnet subnet create `
    --name $SNET_PRIVATE_NAME `
    --vnet-name $VNET_NAME `
    --resource-group $RG_NAME `
    --address-prefix $SNET_PRIVATE_PREFIX `
    --output table

# --- 5. SECURITY (NSG) ---
Write-Host "Step 4: Creating Network Security Group..." -ForegroundColor Green
az network nsg create --name $NSG_NAME --resource-group $RG_NAME --location $LOCATION --output table

Write-Host "Step 5: Creating Inbound SSH Rule for your IP ($MyIP)..." -ForegroundColor Green
az network nsg rule create `
    --name AllowSSH `
    --nsg-name $NSG_NAME `
    --resource-group $RG_NAME `
    --priority 100 `
    --destination-port-ranges 22 `
    --access Allow `
    --protocol Tcp `
    --source-address-prefixes $MyIP `
    --output table

# --- 6. COMPUTE (VM) ---
Write-Host "Step 6: Deploying Virtual Machine ($VM_NAME)..." -ForegroundColor Green
Write-Host "Note: This may take a few minutes." -ForegroundColor Gray

az vm create `
    --resource-group $RG_NAME `
    --name $VM_NAME `
    --location $LOCATION `
    --image $VM_IMAGE `
    --admin-username $ADMIN_USER `
    --generate-ssh-keys `
    --vnet-name $VNET_NAME `
    --subnet $SNET_PUBLIC_NAME `
    --nsg $NSG_NAME `
    --public-ip-address-allocation static `
    --output table

Write-Host "--- Deployment Complete! ---" -ForegroundColor Cyan
$VM_IP = az vm show -d -g $RG_NAME -n $VM_NAME --query publicIps -o tsv
Write-Host "You can connect to your VM using: ssh $ADMIN_USER@$VM_IP" -ForegroundColor Green
