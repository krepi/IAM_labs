<#
.SYNOPSIS
    Checks for active, potentially billable Azure resources in the current subscription.
.DESCRIPTION
    This script queries Azure CLI for active resources. It filters out expected free resource groups
    and resources (like Network Watcher) and alerts the user if any billable resources remain.
.NOTES
    Required Permissions: Reader access to the target Azure Subscription.
    Language: PowerShell (Azure CLI wrapper)
#>

# 1. Verify Azure CLI connection
Write-Host "Verifying connection to Azure..." -ForegroundColor Cyan

$account = az account show --query "{name:name, id:id, state:state}" -o json | ConvertFrom-Json
if ($null -eq $account) {
    Write-Error "No active Azure session found. Please run 'az login' first."
    exit 1
}

Write-Host "Checking subscription: $($account.name) ($($account.id))" -ForegroundColor Cyan

# 2. Retrieve resources
Write-Host "Fetching resources..." -ForegroundColor Cyan
$resourcesJson = az resource list --query "[].{name:name, resourceGroup:resourceGroup, type:type, location:location}" -o json

if ($null -eq $resourcesJson -or $resourcesJson -eq "") {
    Write-Host "No resources found at all." -ForegroundColor Green
    exit 0
}

$resources = $resourcesJson | ConvertFrom-Json

# 3. Filter out known free/diagnostic resources
# We exclude NetworkWatcher resources as they do not generate costs by default.
$billableResources = @()
foreach ($res in $resources) {
    if ($res.resourceGroup -eq "NetworkWatcherRG" -and $res.type -eq "Microsoft.Network/networkWatchers") {
        continue
    }
    $billableResources += $res
}

# 4. Output results
if ($billableResources.Count -gt 0) {
    Write-Host "WARNING: Potentially billable resources detected!" -ForegroundColor Yellow
    Write-Host "Please check the following resources to avoid unexpected charges:" -ForegroundColor Yellow
    Write-Host ""
    
    $billableResources | Format-Table -AutoSize
    
    Write-Host "Recommendation: If these are not needed, delete them or their resource groups." -ForegroundColor Cyan
} else {
    Write-Host "SUCCESS: No billable resources detected. Your subscription is clean." -ForegroundColor Green
}
