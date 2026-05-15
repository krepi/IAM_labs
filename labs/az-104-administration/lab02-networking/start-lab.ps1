# 🚀 Smart Lab Connector
# This script ensures your NSG is updated with your current IP before connecting via SSH.

# --- VARIABLES ---
$RG_NAME = "rg-iam-labs"
$NSG_NAME = "nsg-iam-labs"
$VM_NAME = "vm-jumpbox"
$ADMIN_USER = "azureuser"

Write-Host "--- Preparing Lab Connection ---" -ForegroundColor Cyan

# 1. Detect current public IP
$MyIP = Invoke-RestMethod -Uri "https://api.ipify.org"
Write-Host "Your current IP: $MyIP" -ForegroundColor Gray

# 2. Check Azure Login
az account show --output none
if ($LASTEXITCODE -ne 0) {
    Write-Host "Not logged in. Running 'az login'..." -ForegroundColor Yellow
    az login
}

# 3. Get VM Public IP
$VM_IP = az vm show -d -g $RG_NAME -n $VM_NAME --query publicIps -o tsv
if (-not $VM_IP) {
    Write-Host "ERROR: VM '$VM_NAME' not found or has no Public IP. Is it deployed?" -ForegroundColor Red
    exit
}

# 4. Verify/Update NSG Rule
Write-Host "Checking NSG rules..." -ForegroundColor Gray
$CurrentRuleIP = az network nsg rule show -g $RG_NAME --nsg-name $NSG_NAME --name AllowSSH --query sourceAddressPrefix -o tsv

if ($MyIP -ne $CurrentRuleIP) {
    Write-Host "IP mismatch detected! Updating NSG rule 'AllowSSH' to $MyIP..." -ForegroundColor Yellow
    az network nsg rule update -g $RG_NAME --nsg-name $NSG_NAME --name AllowSSH --source-address-prefixes $MyIP --output none
    Write-Host "NSG updated successfully." -ForegroundColor Green
} else {
    Write-Host "NSG is already configured for your current IP. No update needed." -ForegroundColor Green
}

# 5. Connect
Write-Host "Connecting to $VM_NAME ($VM_IP)..." -ForegroundColor Cyan
ssh -o ConnectTimeout=5 ${ADMIN_USER}@${VM_IP}
