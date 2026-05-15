# Lab 02: Azure Network Infrastructure (AZ-104) 🛡️

## Project Goal
Build a secure, multi-tier network architecture in Azure using Infrastructure as Code (IaC) principles. This lab translates manual Portal actions into automated PowerShell scripts, focusing on network segmentation and secure administrative access (Jumpbox).

## Architecture
- **VNet (`vnet-iam-labs`):** `10.0.0.0/16`
- **Public Subnet (`snet-public`):** `10.0.0.0/24` - Contains the Jumpbox.
- **Private Subnet (`snet-private`):** `10.0.1.0/24` - Isolated backend area.
- **Security:** Network Security Group (`nsg-iam-labs`) with IP-based SSH lockdown (Priority 100).

## 🚀 Automation (How to Run)
Instead of manual clicking, use the provided deployment script. It automatically detects your IP and sets up the entire environment.

```powershell
# Navigate to the lab directory
cd labs/az-104-administration/lab02-networking/

# Run the deployment script
.\deploy_infrastructure.ps1
```

## Work Progress
- [x] Network topology planning.
- [x] Manual Portal walkthrough (`MANUAL_PORTAL.md`).
- [x] Azure CLI + PowerShell automation script.
- [ ] Virtual Machine deployment verification.
- [ ] Communication tests between subnets.

## Operations & Troubleshooting

### 🛡️ SSH Key Permissions (Mac/Linux)
SSH requires private keys to have restricted access (400). If you encounter permission errors:
```bash
chmod 400 ./*.pem
```

### 🛰️ Connecting to the VM
The script will output the public IP of the VM. Connect using:
```bash
ssh azureuser@<VM_PUBLIC_IP>
```

---
*Documentation updated as part of the AZ-104 Administration & SC-300 Identity tracks.*

### 🐧 Useful Linux Commands (Post-connection)
| Command | Purpose |
| :--- | :--- |
| `uptime` | Checks how long the system has been running. |
| `top` / `htop` | Monitors CPU/RAM usage in real-time. |
| `exit` | Safely closes the SSH session. |

---
*Documentation created as part of the study for SC-300/AZ-700 certification.*
