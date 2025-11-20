# Requirements – AWS RedHat OWASP Hardened Web App

## 1. Purpose

This document defines the functional, non-functional, security, and deployment requirements for the **AWS RedHat OWASP Hardened Web App**.  
The goal is to deploy a hardened RHEL-based Apache web server in AWS, following OWASP-aligned hardening practices and Infrastructure as Code (IaC) using Terraform.

---

## 2. Functional Requirements

### 2.1 Web Application Hosting
- R1.1 – Provide a public HTTPS endpoint for a basic Apache web server running on RHEL.
- R1.2 – Serve a test application or hardened landing page to validate connectivity and security headers.
- R1.3 – Support SSH access only for administrators from a trusted CIDR range.

### 2.2 Networking
- R2.1 – Deploy the EC2 instance into a dedicated VPC with at least one public subnet.
- R2.2 – Attach an Internet Gateway and appropriate route tables to enable outbound internet access for patching and package installation.
- R2.3 – Restrict inbound traffic to:
  - HTTPS (443) from the internet.
  - SSH (22) from a configurable admin CIDR.

### 2.3 Logging & Monitoring
- R3.1 – Ship system and Apache logs to Amazon CloudWatch Logs.
- R3.2 – Enable basic metrics and alarms for:
  - EC2 instance status.
  - CPU utilization.
- R3.3 – Provide log groups and log streams clearly labeled for this project.

---

## 3. Non-Functional Requirements

### 3.1 Availability & Reliability
- N1.1 – Target availability of at least **99.5%** for the web endpoint (single instance, non-HA lab).
- N1.2 – Instance should automatically restart on failure where possible (EC2 default behavior).

### 3.2 Performance
- N2.1 – Instance type must be sufficient to serve light demo / lab traffic (t3.micro or t3.small equivalent).
- N2.2 – Response time for the landing page should generally be < 500 ms under light load.

### 3.3 Maintainability
- N3.1 – All infrastructure should be defined using Terraform where possible.
- N3.2 – Terraform code should be modular and readable, using variables for:
  - Region
  - Instance type
  - Key pair name
  - Admin CIDR
- N3.3 – Configuration details must be documented in `README.md` and `TERRAFORM_NOTES.md`.

---

## 4. Security Requirements (Summary)

> Detailed security requirements are captured in `security_requirements.md`.  
> This section summarizes the key security expectations.

- S1 – Enforce least-privilege security groups (only required ports open).
- S2 – Use an IAM role with least privilege for the EC2 instance to write to CloudWatch Logs.
- S3 – Disable root SSH login and require key-based authentication.
- S4 – Apply OS-level hardening steps aligned with OWASP and CIS-style guidance (e.g., firewall rules, package updates).
- S5 – Ensure logs are retained for a minimum of 30 days (configurable).
- S6 – Tag all resources for ownership, environment, and cost tracking (e.g., `Project="AWS-RedHat-OWASP-Hardened-App"`).

---

## 5. Terraform / Deployment Requirements

- T1 – Terraform version **1.x** or later.
- T2 – AWS provider configured with an IAM identity that has permission to create:
  - VPC, subnets, route tables, IGW
  - EC2 instances
  - IAM roles and instance profiles
  - Security groups
  - CloudWatch log groups and log streams
- T3 – Ability to pass in the following as variables:
  - AWS region
  - Instance type
  - AMI ID for RHEL
  - Key pair name
  - Admin CIDR for SSH
- T4 – Terraform state may be stored locally for lab use; remote backend can be added later.

---

## 6. Assumptions

- A1 – A valid AWS account is available and properly configured.
- A2 – Network egress to the internet is allowed for patching and YUM package installs.
- A3 – RHEL licensing/subscription is available (or the project notes clearly state where this became a constraint).
- A4 – This is a **lab / PoC** and not a production workload.

---

## 7. Out of Scope

- O1 – Multi-AZ or auto-scaling high availability.
- O2 – WAF, CDN, or advanced DDoS protection (can be added in a future iteration).
- O3 – CI/CD integration for application deployments.
- O4 – Database or application-tier scaling beyond a single EC2 instance.
