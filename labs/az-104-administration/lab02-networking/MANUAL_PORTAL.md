# 📖 Manual: Azure Network & VM Deployment (Portal Walkthrough)

This document summarizes the manual deployment of Lab 01 infrastructure, explaining the technical rationale behind each decision made in the Azure Portal.

## 🏗️ Phase 1: Virtual Network (VNet) & Segmentation
**Action:** Created `vnet-iam-labs` with address space `10.0.0.0/16` and two subnets.

### 1.1. Subnet Segmentation
- **snet-public (`10.0.0.0/24`):** Designated for "front-facing" resources like our Jumpbox. 
- **snet-private (`10.0.1.0/24`):** Designated for internal resources (databases, backend) that should never be directly reachable from the internet.

**Why? (The IAM/Security Angle):**
Segmentation is the first layer of **Defense in Depth**. By placing the Jumpbox in a separate subnet, we create a "chokepoint". If someone were to compromise a machine in the public subnet, they still have to pass through internal firewalls to reach the private subnet.

### 1.2. Default Outbound Access (DOA) Lockdown
In the "Edit Subnet" settings, we enabled the "Private subnet" feature (No default outbound access).
- **Rationale:** Prevents "Shadow IT" or malware from calling home to the internet. Any outbound traffic must now be explicitly allowed via a NAT Gateway or a Public IP.

---

## 🛡️ Phase 2: Network Security Group (NSG) - The Cloud Firewall
**Action:** Created `nsg-iam-labs` and added a custom inbound rule.

### 2.1. The "Default Deny" Principle
By default, Azure NSGs have a `DenyAllInBound` rule (priority 65500). 
- **Rationale:** It is safer to block everything and allow only what is necessary (**Least Privilege**) than to allow everything and try to block threats.

### 2.2. IP Lockdown (Inbound Rule: 100)
We added a rule allowing port `22` (SSH) but only from your specific public IP.
- **Why Priority 100?** In Azure, rules are processed from lowest to highest priority number. By using 100, we ensure this rule is evaluated long before the `DenyAll` rule at 65500.
- **Why Source IP?** This effectively hides your VM from the rest of the world. Even if a hacker knows your VM's public IP, the Azure backbone will drop their packets before they even reach your machine.

---

## 🖥️ Phase 3: Virtual Machine (VM) Deployment
**Action:** Created `vm-jumpbox` and associated it with existing networking.

### 3.1. Association vs. Creation
During the Networking tab, we chose **Advanced** for the NIC security group and selected our pre-created `nsg-iam-labs`.
- **Rationale:** While the Portal offers to create a "Basic" NSG for you, doing it manually first (as we did) ensures that you don't end up with dozens of auto-generated, messy NSGs with generic names like `vm-jumpbox-nsg-123`.

### 3.2. Public IP Persistence
We checked the box "Delete public IP and NIC when VM is deleted".
- **Rationale:** This is **Cloud Hygiene**. Forgotten Public IPs cost money and forgotten NICs clutter the subscription.

---

## 🚀 Summary for Tomorrow
Tomorrow, we will translate these "clicks" into **Azure CLI** commands. 
- Instead of clicking "Add subnet", we will run `az network vnet subnet create`.
- Instead of filling a form for NSG, we will run `az network nsg rule create`.

*This manual was generated based on the successful portal deployment on 2026-05-14.*
