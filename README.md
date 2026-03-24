#  infra-zero

> Zero to production-ready infrastructure using Terraform on AWS (Free Tier)

---

##  / Problem

Setting up cloud infrastructure manually is:

* slow
* error-prone
* not reproducible

This project solves that by:
👉 Defining infrastructure as code
👉 Automating provisioning
👉 Making deployments consistent and repeatable

---

## What It Does

* Provisions EC2 instance on AWS
* Configures security groups (SSH + HTTP)
* Automatically installs and runs Nginx
* Outputs public IP after deployment
* Runs Terraform plan via GitHub Actions (CI/CD)

---

## Tech Stack

* AWS (EC2, Security Groups)
* Terraform
* GitHub Actions (CI/CD)
* Linux (Ubuntu)
* Nginx

---

## Architecture

```
User
 ↓
Browser (HTTP)
 ↓
Public IP
 ↓
AWS Security Group (80 open)
 ↓
EC2 (Ubuntu)
 ↓
Nginx (auto-installed via user_data)
```

---

## Key Features

* Infrastructure as Code (Terraform)
* Automated provisioning (no manual SSH setup required)
* CI/CD pipeline for infrastructure validation
* Free-tier friendly setup

---

## How to Use

### 1. Clone repo

```bash
git clone https://github.com/ak3ph/infra-zero.git
cd infra-zero/terraform
```

---

### 2. Configure AWS

```bash
aws configure
```

---

### 3. Deploy

```bash
terraform init
terraform apply
```

---

### 4. Access

Open in browser:

```
http://<output-public-ip>
```

---

## CI/CD

On every push:

* Terraform init runs
* Terraform plan runs
* Infrastructure changes are validated automatically

---

## Notes

* Uses AWS Free Tier (`t2.micro`)
* Public IP may change on recreation
* For production → use Elastic IP

---

## Learnings

* Terraform basics and resource lifecycle
* AWS EC2 provisioning
* Security group configuration
* Cloud-init & user_data automation
* CI/CD for infrastructure
* Debugging real-world infra issues

---

## Future Improvements

* Add Elastic IP (static IP)
* Add domain (Route53)
* Add HTTPS (Let's Encrypt)
* Add load balancer
* Modular Terraform structure

---

## Author

Yash Thakur
🔗 [https://ak3ph.dev](https://ak3ph.dev)
🔗 [https://github.com/ak3ph](https://github.com/ak3ph)
