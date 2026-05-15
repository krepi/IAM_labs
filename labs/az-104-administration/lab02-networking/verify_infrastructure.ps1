# 🔍 Lab 02: Infrastructure Compliance & Audit Script
# This script verifies if the Azure environment matches the security requirements.

# --- VARIABLES ---
$RG_NAME = "rg-iam-labs"
$VNET_NAME = "vnet-iam-labs"
$NSG_NAME = "nsg-iam-labs"
$VM_NAME = "vm-jumpbox"

# --- HELPER FUNCTION ---
function Test-Condition {
    param($Condition, $Message)
    if ($Condition) {
        Write-Host "[PASS] " -NoNewline -ForegroundColor Green
        Write-Host $Message
    } else {
        Write-Host "[FAIL] " -NoNewline -ForegroundColor Red
        Write-Host $Message
    }
}

Write-Host "`n--- Starting Infrastructure Audit ---" -ForegroundColor Cyan

# 1. Detect current public IP
$MyIP = Invoke-RestMethod -Uri "https://api.ipify.org"
Write-Host "Current local public IP: $MyIP" -ForegroundColor Gray

# 2. Verify Resource Group
$RG_Exists = az group exists --name $RG_NAME
Test-Condition -Condition ($RG_Exists -eq "true") -Message "Resource Group '$RG_NAME' exists."

# 3. Verify VNet and Subnets
$VNET_Data = az network vnet show -g $RG_NAME -n $VNET_NAME --query "{subnets:subnets[].name}" -o json | ConvertFrom-Json
$HasPublic = $VNET_Data.subnets -contains "snet-public"
$HasPrivate = $VNET_Data.subnets -contains "snet-private"
Test-Condition -Condition ($HasPublic -and $HasPrivate) -Message "VNet contains both 'snet-public' and 'snet-private'."

# 4. Verify NSG & Rule 22 (SSH)
$NSG_Rule = az network nsg rule show -g $RG_NAME --nsg-name $NSG_NAME --name AllowSSH -o json | ConvertFrom-Json
$CorrectPort = $NSG_Rule.destinationPortRange -eq "22"
$CorrectIP = $NSG_Rule.sourceAddressPrefix -eq $MyIP
$CorrectAccess = $NSG_Rule.access -eq "Allow"

Test-Condition -Condition ($CorrectPort) -Message "NSG Rule 'AllowSSH' is targeting Port 22."
Test-Condition -Condition ($CorrectIP) -Message "NSG Rule 'AllowSSH' Source IP ($($NSG_Rule.sourceAddressPrefix)) matches your current IP ($MyIP)."
Test-Condition -Condition ($CorrectAccess) -Message "NSG Rule 'AllowSSH' Access is set to 'Allow'."

# 5. Verify VM Status
$VM_Data = az vm show -d -g $RG_NAME -n $VM_NAME --query powerState -o tsv
Test-Condition -Condition ($VM_Data -eq "VM running") -Message "Virtual Machine '$VM_NAME' is currently running."

# 6. Verify NSG Association (Least Privilege Check)
$NIC_NSG = az network nic show -g $RG_NAME --name $(az vm show -g $RG_NAME -n $VM_NAME --query "networkProfile.networkInterfaces[0].id" -o tsv | Split-Path -Leaf) --query "networkSecurityGroup.id" -o tsv
Test-Condition -Condition ($NIC_NSG -like "*$NSG_NAME*") -Message "VM is correctly associated with '$NSG_NAME'."

Write-Host "--- Audit Complete ---`n" -ForegroundColor Cyan
