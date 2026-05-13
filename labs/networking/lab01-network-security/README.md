# Lab 01: Azure Network Security 🛡️

## Project Goal
Build a secure, multi-tier network architecture in Azure. The project demonstrates the practical application of network segmentation and "Zero Trust" principles in administrative access.

## Architecture (Planned)
- **VNet:** `10.0.0.0/16`
- **Public Subnet:** Jump Box server (accessible via SSH only from my IP).
- **Private Subnet:** Backend server (completely isolated from the internet).
- **Security:** Network Security Groups (NSG), SSH keys (RSA).

## Work Progress
- [x] Network topology planning.
- [ ] Azure Virtual Network (VNet) configuration.
- [ ] Virtual Machine deployment (Ubuntu Server).
- [ ] Secure SSH access configuration (Identity Keys).
- [ ] Communication tests and access blocking.

## Operations & Troubleshooting

### 🛡️ SSH Key Permissions (Windows/PowerShell)
SSH requires private keys to have restricted access. If you encounter the "Unprotected Private Key File" error, use the following commands to reset ACLs and grant read-only access to your current user:

```powershell
# Reset and restrict access to the .pem key
icacls.exe .\vm-jumpbox-prod_key.pem /reset
icacls.exe .\vm-jumpbox-prod_key.pem /inheritance:r
icacls.exe .\vm-jumpbox-prod_key.pem /grant:r "${env:USERNAME}:R"
```

### 🛰️ Connecting to the VM
After configuring the local `~/.ssh/config` file, connection is simplified to:
```powershell
ssh jumpbox
```

### 🐧 Useful Linux Commands (Post-connection)
| Command | Purpose |
| :--- | :--- |
| `uptime` | Checks how long the system has been running. |
| `top` / `htop` | Monitors CPU/RAM usage in real-time. |
| `exit` | Safely closes the SSH session. |

---
*Documentation created as part of the study for SC-300/AZ-700 certification.*
