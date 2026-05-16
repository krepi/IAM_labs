# 📜 Lab 02: Infrastructure as Code (Modular Edition)
# This script uses shared templates to deploy the environment.

# --- 1. SETTINGS ---
$RG_NAME = "rg-iam-labs"
$LOCATION = "polandcentral"

# --- 2. ENVIRONMENT CHECK ---
Write-Host "--- Starting Modular Infrastructure Deployment ---" -ForegroundColor Cyan

# Check Azure Login
az account show --output none
if ($LASTEXITCODE -ne 0) {
    Write-Host "You are not logged in. Please log in to Azure." -ForegroundColor Yellow
    az login
}

# --- 3. CALL TEMPLATES ---

# Deploy Networking
Write-Host "`n[1/2] Calling Networking Template..." -ForegroundColor Cyan
. ../../templates/networking/base-vnet-nsg.ps1 -RG_NAME $RG_NAME -LOCATION $LOCATION

# Deploy Compute (Jumpbox)
Write-Host "`n[2/2] Calling Compute Template..." -ForegroundColor Cyan
. ../../templates/compute/base-vm-jumpbox.ps1 -RG_NAME $RG_NAME -LOCATION $LOCATION

Write-Host "`n--- Modular Deployment Complete! ---" -ForegroundColor Green
