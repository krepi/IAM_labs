# 🧩 Template: Base Networking (VNet, Subnets, NSG)
# Usage: ./templates/networking/base-vnet-nsg.ps1 -RG_NAME "my-rg" -LOCATION "polandcentral"

param (
    [string]$RG_NAME = "rg-iam-labs",
    [string]$LOCATION = "polandcentral",
    [string]$VNET_NAME = "vnet-iam-labs",
    [string]$VNET_PREFIX = "10.0.0.0/16",
    [string]$SNET_PUBLIC_NAME = "snet-public",
    [string]$SNET_PUBLIC_PREFIX = "10.0.0.0/24",
    [string]$SNET_PRIVATE_NAME = "snet-private",
    [string]$SNET_PRIVATE_PREFIX = "10.0.1.0/24",
    [string]$NSG_NAME = "nsg-iam-labs"
)

Write-Host "--- Template: Setting up Networking ---" -ForegroundColor Cyan

# Detect public IP for SSH lockdown
$MyIP = Invoke-RestMethod -Uri "https://api.ipify.org"
Write-Host "Locking NSG to your current IP: $MyIP" -ForegroundColor Gray

# Create Resource Group
az group create --name $RG_NAME --location $LOCATION --output none

# Create VNet and Public Subnet
az network vnet create `
    --name $VNET_NAME `
    --resource-group $RG_NAME `
    --location $LOCATION `
    --address-prefix $VNET_PREFIX `
    --subnet-name $SNET_PUBLIC_NAME `
    --subnet-prefix $SNET_PUBLIC_PREFIX `
    --output none

# Create Private Subnet
az network vnet subnet create `
    --name $SNET_PRIVATE_NAME `
    --vnet-name $VNET_NAME `
    --resource-group $RG_NAME `
    --address-prefix $SNET_PRIVATE_PREFIX `
    --output none

# Create NSG
az network nsg create --name $NSG_NAME --resource-group $RG_NAME --location $LOCATION --output none

# Create SSH Rule
az network nsg rule create `
    --name AllowSSH `
    --nsg-name $NSG_NAME `
    --resource-group $RG_NAME `
    --priority 100 `
    --destination-port-ranges 22 `
    --access Allow `
    --protocol Tcp `
    --source-address-prefixes $MyIP `
    --output none

Write-Host "Networking and NSG setup complete." -ForegroundColor Green
