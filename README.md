# 🚀 Terraform Enterprise Infrastructure on Azure

A production-ready, modular, secure, and scalable Microsoft Azure infrastructure project built using **Terraform** and Infrastructure as Code (IaC) best practices.

This project demonstrates automated Azure resource provisioning, reusable Terraform architecture, remote state management, environment isolation, and enterprise-level cloud infrastructure deployment.

## 🏗️ Architecture

```text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
CI/CD Pipeline
    │
    ▼
Terraform
    │
    ├── Azure Resource Group
    ├── Virtual Network
    ├── Subnets
    ├── Network Security Groups
    ├── Virtual Machines
    ├── Storage Accounts
    ├── Azure Key Vault
    └── Azure Monitor
```

## ✨ Key Features

- Modular and reusable Terraform architecture
- Automated Microsoft Azure resource provisioning
- Infrastructure as Code implementation
- Separate development, testing, and production environments
- Azure Blob Storage remote backend
- Terraform state management and state locking
- Secure Azure networking
- Network Security Group rules
- Centralized secrets management
- Terraform validation and formatting
- CI/CD-ready infrastructure
- Scalable and maintainable project structure

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Microsoft Azure | Cloud infrastructure |
| Terraform | Infrastructure provisioning |
| Azure CLI | Azure resource management |
| Git | Source-code version control |
| GitHub | Repository management |
| Azure DevOps | CI/CD automation |
| PowerShell | Infrastructure automation |
| Bash | Command-line automation |

## 📂 Project Structure

```text
terraform-enterprise-infrastructure/
│
├── modules/
│   ├── resource-group/
│   ├── network/
│   ├── compute/
│   ├── storage/
│   ├── key-vault/
│   └── monitoring/
│
├── environments/
│   ├── dev/
│   ├── test/
│   └── prod/
│
├── backend.tf
├── providers.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
├── .gitignore
└── README.md
```

## ⚙️ Prerequisites

Install and configure:

- Terraform
- Microsoft Azure CLI
- Git
- An active Microsoft Azure subscription

Verify the installations:

```bash
terraform --version

az --version

git --version
```

## 🔐 Azure Authentication

Sign in to Microsoft Azure:

```bash
az login
```

Verify the active Azure subscription:

```bash
az account show
```

To select another subscription:

```bash
az account set \
--subscription "YOUR_SUBSCRIPTION_ID"
```

## 🚀 Deployment

Clone the repository:

```bash
git clone https://github.com/gauravdubey5/terraform-enterprise-infrastructure.git
```

Open the project directory:

```bash
cd terraform-enterprise-infrastructure
```

Initialize Terraform:

```bash
terraform init
```

Format the Terraform configuration:

```bash
terraform fmt -recursive
```

Validate the configuration:

```bash
terraform validate
```

Generate an execution plan:

```bash
terraform plan
```

Deploy the Azure infrastructure:

```bash
terraform apply
```

Type:

```text
yes
```

when Terraform requests confirmation.

## 🧹 Destroy Infrastructure

To remove all infrastructure created by Terraform:

```bash
terraform destroy
```

Review the resources carefully before confirming the destroy operation.

## 🌍 Environment Management

The project supports multiple isolated environments:

```text
Development → environments/dev

Testing → environments/test

Production → environments/prod
```

Environment-specific variable files can be used:

```bash
terraform plan \
-var-file="environments/dev/dev.tfvars"
```

Deploy the development environment:

```bash
terraform apply \
-var-file="environments/dev/dev.tfvars"
```

## 🔒 Security Best Practices

- Do not commit Terraform state files.
- Do not store credentials in Terraform files.
- Use Azure Key Vault for sensitive information.
- Use Azure Blob Storage for the remote backend.
- Apply least-privilege RBAC permissions.
- Restrict inbound traffic through NSG rules.
- Use pull requests and branch protection.
- Run security checks before infrastructure deployment.

## 🔍 Terraform Quality Checks

Format the code:

```bash
terraform fmt -check -recursive
```

Validate the code:

```bash
terraform validate
```

Run Terraform security scanning:

```bash
tfsec .
```

Run static analysis:

```bash
tflint
```

Run policy and configuration scanning:

```bash
checkov -d .
```

## 📤 Terraform Outputs

After deployment, view all outputs:

```bash
terraform output
```

View a specific output:

```bash
terraform output resource_group_name
```

## 🔮 Future Improvements

- Azure DevOps multi-stage pipeline
- GitHub Actions CI/CD workflow
- Automated Terraform security scanning
- Azure Kubernetes Service integration
- Application Gateway integration
- Azure Load Balancer
- Private Endpoints
- Azure Monitor alerts
- Log Analytics Workspace
- Cost-management policies

## 🤝 Contributing

Contributions and improvements are welcome.

1. Fork this repository.
2. Create a feature branch.

```bash
git checkout -b feature/new-feature
```

3. Commit the changes.

```bash
git commit -m "Add new infrastructure feature"
```

4. Push the branch.

```bash
git push origin feature/new-feature
```

5. Create a pull request.

## 👨‍💻 Author

**Gaurav Dubey**

DevOps & Cloud Engineer

- GitHub: `gauravdubey5`
- LinkedIn: `gauravdubey5`
- Portfolio: gauravdubey.pages.dev

## ⭐ Support

If this project is useful, give the repository a **⭐ Star**.

## 📄 License

This project is available under the MIT License.

---

Made with ❤️ by **Gaurav Dubey**