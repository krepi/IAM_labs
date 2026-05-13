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
- [ ] Communication tests and access blocking.

---
*Documentation created as part of the study for SC-300 certification.*
