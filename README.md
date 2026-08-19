# Terraform — AWS Infrastructure & Learning Projects

This repository documents my hands-on experience learning and applying
Terraform to provision and manage AWS infrastructure.

The goal of this repository is to demonstrate practical experience with
Infrastructure as Code (IaC), AWS services, Terraform configuration,
version control, and cloud infrastructure design.

## Projects & Exercises

| Project / Exercise | Description | Key Concepts |
|---|---|---|
| [Terraform VPC](./Terraform%20VPC%20-%2002/) | AWS VPC infrastructure provisioned with Terraform | VPC, subnets, route tables, Internet Gateway, Terraform |
| [HCL Fundamentals](./HashiCorp%20Configuration%20Language%20-%2004/) | Exploration of HashiCorp Configuration Language syntax | Resources, data sources, variables, outputs, locals, modules |
| [Terraform S3 Bucket](./Terraform%20S3%20Bucket%20-%2005/) | AWS S3 bucket provisioned and managed with Terraform | AWS provider, Random provider, S3, resource references, outputs, Terraform state |
| [Multi-Region S3](./Terraform%20Multi-Region%20S3%20-%2009/) | S3 buckets deployed across multiple AWS regions using separate AWS provider configurations | Provider aliases, multiple provider configurations, multi-region deployments |

## Technologies

- **Terraform**
- **Amazon Web Services (AWS)**
- **HashiCorp Configuration Language (HCL)**
- **Git / GitHub**
- **Linux / WSL**
- **Visual Studio Code**

## Terraform Concepts

Through these projects and exercises, I am developing experience with:

- Infrastructure as Code (IaC)
- Terraform providers
- Multiple provider configurations
- Provider aliases
- Multi-region AWS deployments
- Terraform resources
- Terraform data sources
- Input variables
- Outputs
- Local values
- Terraform modules
- Terraform state
- `terraform init`
- `terraform plan`
- `terraform apply`
- `terraform destroy`
- `terraform validate`
- `terraform fmt`
- Git / GitHub version control

## Repository Structure

```text
terraform/
├── Terraform VPC - 02/
│   └── AWS VPC infrastructure
│
├── HashiCorp Configuration Language - 04/
│   └── HCL fundamentals
│
├── Terraform S3 Bucket - 05/
│   └── AWS S3 bucket infrastructure
│
├── Terraform Multi-Region S3 - 09/
│   └── Multi-region S3 and provider aliases
│
└── README.md
