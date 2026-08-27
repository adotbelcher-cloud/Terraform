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
| [NGINX Server on AWS](./NGINX%20Server%20on%20AWS%20-%2010/) | AWS VPC and EC2 infrastructure deployed with Terraform and configured to run an NGINX web server | VPC, subnets, route tables, Internet Gateway, security groups, EC2, AMI data sources, user data |
| [S3 Static Website](./S3%20Static%20Website/) | Static website hosted on Amazon S3 and managed with Terraform | S3, bucket policies, public access, static website hosting, S3 objects, Terraform outputs |
| [Input Variables](./Input%20Variables%20-%2015/) | EC2 instance configuration managed through Terraform input variables and validation | Input variables, variable types, defaults, validation rules, AMI data sources |
| [Using Objects for Volume Configuration](./Using%20Objects%20for%20Volume%20Configuration%20-%2016/) | Refactored EC2 configuration using structured variables and flexible tagging | Terraform objects, maps, `merge()` |
| [Working with tfvars](./Working%20with%20tfvar%20-%2017/) | Managed environment-specific Terraform configurations using variable definition files | `.tfvars` files, variable overrides, environment configuration |

## Technologies

- **Terraform**
- **Amazon Web Services (AWS)**
- **HashiCorp Configuration Language (HCL)**
- **Git / GitHub**
- **Linux / WSL**
- **Visual Studio Code**

### Terraform & Infrastructure

- Infrastructure as Code (IaC)
- Terraform providers & provider configuration
- Provider aliases & multi-region deployments
- Terraform resources & data sources
- Input variables, types, defaults & validation
- Variable overrides & `.tfvars` files
- Outputs & local values
- Terraform modules
- Terraform state
- Terraform workflow: `init`, `plan`, `apply`, `destroy`
- Configuration validation & formatting: `validate`, `fmt`

### AWS Infrastructure

- Amazon VPCs, subnets & routing
- AWS EC2
- Amazon Machine Images (AMIs)
- EC2 user data & cloud-init
- AWS security groups
- Amazon S3
- S3 static website hosting
- S3 bucket policies & public access configuration
- S3 objects & content types

### Development & Version Control

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
├── NGINX Server on AWS - 10/
│   └── AWS VPC, EC2, security group, and NGINX web server
|
├── S3 Static Website/
│   └── Static website hosted on Amazon S3 with Terraform
│
├── Input Variables - 15/ 
│   └── EC2 instance configuration using input variables and validation 
│
├── Using Objects for Volume Configuration - 16/
│   └── EC2 configuration using objects, maps, and flexible tagging
│
├── Working with tfvar - 17/
│   └── Environment-specific configuration using .tfvars files
│
└── README.md