# Changelog

## [2025-03-31]
- Initialized project.
- Created VPC (`aws-redhat-owasp-vpc`) and subnet (`aws-redhat-owasp-subnet`).
- Attached Internet Gateway to VPC.
- Configured Route Table for internet access.
- Set up Security Group restricting SSH (port 22) and HTTPS (port 443) to trusted `/32` CIDR.
- Launched RHEL EC2 instance with Apache installed.
- Created and attached IAM role (`aws-owasp`) via instance profile.
- Installed CloudWatch Agent for log streaming to `/aws/honeypot/cowrie`.
- Identified Red Hat subscription limitation for installing Fail2Ban.