# Terraform — AWS Infrastructure & Learning Projects

This repository documents my hands-on experience building and managing AWS infrastructure with Terraform.

The projects and exercises demonstrate practical experience with Infrastructure as Code (IaC), AWS services, Terraform configuration, reusable infrastructure patterns, version control, and cloud infrastructure design.


## Projects & Key Exercises

| Project / Exercise | Description | Key Concepts |
|---|---|---|
| [Terraform VPC](./Terraform%20VPC%20-%2002/) | Built foundational AWS networking infrastructure using Terraform | VPC, subnets, route tables, Internet Gateway, Terraform |
| [Terraform S3 Bucket](./Terraform%20S3%20Bucket%20-%2005/) | Provisioned and managed an S3 bucket using Terraform | AWS provider, Random provider, S3, resource references, Terraform state |
| [Multi-Region S3](./Terraform%20Multi-Region%20S3%20-%2009/) | Deployed S3 infrastructure across multiple AWS regions | Provider aliases, multi-region deployments |
| [NGINX Server on AWS](./NGINX%20Server%20on%20AWS%20-%2010/) | Deployed a VPC, EC2 instance, and NGINX web server using Terraform | VPC, subnets, routing, security groups, EC2, AMIs, user data |
| [S3 Static Website](./S3%20Static%20Website/) | Hosted a static website on Amazon S3 using Terraform | S3, bucket policies, public access, static website hosting, objects |
| [Terraform Configuration & Data Structures](./Input%20Variables%20-%2015/) | Applied variables, locals, objects, `.tfvars`, outputs, and collection transformations to build reusable Terraform configurations | Variables, locals, objects, maps, lists, `for` expressions, outputs |
| [Creating Multiple Resources with count](./Creating%20Multiple%20Resources%20with%20count%20-%2024/) | Created and referenced multiple AWS resources dynamically using Terraform's `count` meta-argument | `count`, `count.index`, resource indexing, dynamic resource creation |

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
- AWS resource provisioning & management
- Input variables, variable types, defaults & validation
- `.tfvars` files & environment-specific configuration
- Local values, objects & reusable configuration
- Terraform resources & data sources
- Outputs & resource value references
- `for` expressions & collection transformations
- Lists, maps & objects
- `count` meta-argument & indexed resources
- Terraform state
- Terraform workflow: `init`, `plan`, `apply`, `destroy`
- Configuration validation & formatting: `validate`, `fmt`

### AWS Infrastructure

- AWS EC2
- Amazon Machine Images (AMIs)
- EC2 user data & cloud-init
- AWS security groups
- Amazon S3
- S3 static website hosting
- S3 bucket policies & public access configuration
- S3 objects & content types
- S3 bucket naming with Random ID
- EC2 instance deployment across multiple subnets

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
│   └── Terraform configuration, variables, locals, outputs, and data structures
│
├── Using Objects for Volume Configuration - 16/
│   └── EC2 configuration using objects, maps, and flexible tagging
│
├── Working with tfvar - 17/
│   └── Environment-specific configuration using .tfvars files
│
├── Working with Locals - 18/
│   └── Reusable local values, common tags, and S3 configuration
│
├── Working with Outputs - 20/
│   └── Terraform outputs and retrieving resource values
│
├── For Expressions with Lists - 22/
│   └── List manipulation using Terraform for expressions
│
├── For Expressions with Maps - 23/
│   └── Map and list transformations using Terraform for expressions
│
├── Creating Multiple Resources with count - 24/
│   └── Creating and referencing multiple AWS resources with count
│
└── README.md