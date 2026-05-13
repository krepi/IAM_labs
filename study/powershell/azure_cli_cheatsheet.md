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
