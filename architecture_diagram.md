# Architecture Diagram

The diagram `aws-redhat-owasp-architecture.png` shows:

- Internet and optional Route 53 DNS entry.
- Security Group restricting:
  - HTTPS (443) from the internet.
  - SSH (22) from an admin CIDR.
- Public subnet in a dedicated VPC.
- RHEL EC2 instance running Apache.
- Admin workstation reaching the instance over SSH/HTTPS from the trusted CIDR.
- IAM role / instance profile attached to the EC2 instance.
- CloudWatch Logs and metrics receiving system and Apache logs.
