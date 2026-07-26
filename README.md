# 🚀 Azure Enterprise Infrastructure using Terraform

> Production-ready Azure Infrastructure as Code (IaC) using Terraform with a modular architecture, reusable modules, and environment-based deployments.

![Terraform](https://img.shields.io/badge/Terraform-v1.8+-623CE4?style=for-the-badge&logo=terraform)
![Azure](https://img.shields.io/badge/Microsoft-Azure-0078D4?style=for-the-badge&logo=microsoftazure)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![IaC](https://img.shields.io/badge/Infrastructure-as-Code-orange?style=for-the-badge)

---

# 📖 Overview

This repository demonstrates how to build and manage Azure infrastructure using **Terraform** following a modular and reusable architecture.

The project follows enterprise Infrastructure as Code (IaC) practices where each Azure service is developed as an independent Terraform module and deployed using environment-specific configurations.

---

# ✨ Features

- Modular Terraform Architecture
- Azure Infrastructure as Code (IaC)
- Environment-based Deployments (Dev / QA / Prod)
- Reusable Terraform Modules
- Map(Object) Variable Structure
- `for_each` Resource Deployment
- Enterprise Folder Structure
- Scalable Infrastructure Design

---

# 🏗 Architecture

```
                     Azure Subscription
                              │
                       Resource Group
                              │
              ┌───────────────┴───────────────┐
              │                               │
        Virtual Network                 Storage Account
              │                               │
      ┌───────┴────────┐                 Key Vault
      │                │
 Frontend          Backend
  Subnet            Subnet
      │                │
      │          Virtual Machine
      │
 Azure Bastion
      │
 NAT Gateway
      │
 Public IP
      │
 Load Balancer
      │
 Application Gateway
```

---

# 📂 Repository Structure

```
terraform-enterprise-infrastructure/
│
├── environments/
│   ├── dev/
│   ├── qa/
│   └── prod/
│
├── modules/
│   ├── azurerm-resource-groups/
│   ├── azurerm-virtual-networks/
│   ├── azurerm-subnets/
│   ├── azurerm-network-security-groups/
│   ├── azurerm-route-tables/
│   ├── azurerm-public-ips/
│   ├── azurerm-nat-gateways/
│   ├── azurerm-bastions/
│   ├── azurerm-load-balancers/
│   ├── azurerm-application-gateways/
│   ├── azurerm-storage-accounts/
│   ├── azurerm-key-vaults/
│   ├── azurerm-managed-disks/
│   └── azurerm-virtual-machines/
│
├── README.md
├── LICENSE
├── CHANGELOG.md
└── .gitignore
```

---

# ☁ Azure Resources

- Resource Groups
- Virtual Networks
- Subnets
- Network Security Groups
- Route Tables
- Public IP Addresses
- NAT Gateways
- Azure Bastion
- Load Balancers
- Application Gateways
- Storage Accounts
- Key Vaults
- Managed Disks
- Linux Virtual Machines

---

# 🧩 Project Design

This repository uses a **Map(Object)** design pattern.

Example:

```hcl
resource_groups = {
  rg1 = {
    name       = "dev-rg"
    location   = "Central India"
    managed_by = "Terraform"
  }
}
```

Each Terraform module accepts an entire map and provisions resources using `for_each`.

Example:

```terraform
module "resource_groups" {
  source          = "../../modules/azurerm-resource-groups"
  resource_groups = var.resource_groups
}
```

This approach makes the code:

- Reusable
- Scalable
- Easy to maintain
- Environment independent

---

# 🚀 Getting Started

## Clone Repository

```bash
git clone https://github.com/gauravdubey5/terraform-enterprise-infrastructure.git

cd terraform-enterprise-infrastructure
```

---

## Navigate to Environment

```bash
cd environments/dev
```

---

## Initialize Terraform

```bash
terraform init
```

---

## Format Terraform Code

```bash
terraform fmt
```

---

## Validate Configuration

```bash
terraform validate
```

---

## View Execution Plan

```bash
terraform plan
```

---

## Deploy Infrastructure

```bash
terraform apply
```

---

## Destroy Infrastructure

```bash
terraform destroy
```

---

# 📁 Environment Structure

```
environments/

├── dev
├── qa
└── prod
```

Each environment contains:

- backend.tf
- providers.tf
- versions.tf
- variables.tf
- terraform.tfvars
- main.tf
- outputs.tf

---

# 📦 Module Structure

Every Terraform module follows the same structure.

```
module-name/

├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```

---

# 🛠 Technologies

- Terraform
- Microsoft Azure
- AzureRM Provider
- Azure CLI
- Infrastructure as Code (IaC)
- Git
- GitHub

---

# 📚 Best Practices

- Modular Infrastructure
- Reusable Modules
- Environment Separation
- Version Controlled Infrastructure
- Map(Object) Variables
- for_each Resource Deployment
- Standard Folder Structure
- Clean Terraform Code

---

# 🔮 Future Improvements

- Azure Storage Remote Backend
- Azure Monitor
- Log Analytics Workspace
- Azure Firewall
- Virtual Network Peering
- Private Endpoints
- Diagnostic Settings
- Azure Kubernetes Service (AKS)
- Virtual Machine Scale Sets (VMSS)

---

# 📋 Prerequisites

- Terraform >= 1.8
- Azure CLI
- Azure Subscription
- Git
- Contributor access on Azure

---

# 👨‍💻 Author

**Gaurav Dubey**

- GitHub: https://github.com/gauravdubey5
- LinkedIn: https://linkedin.com/in/gauravdubey5
- GitHub: https://gauravdubey.pages.dev/

---

# ⭐ Support

If you found this project useful:

- ⭐ Star this repository
- 🍴 Fork it
- 🐛 Report issues
- 🤝 Contribute with pull requests

---

# 📄 License

This project is licensed under the **MIT License**.

---

## 💙 Built with Terraform and Microsoft Azure