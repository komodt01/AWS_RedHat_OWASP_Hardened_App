# Business Case: AWS Red Hat OWASP-Hardened Web Application

A security-conscious organization needed to deploy a public-facing web application on AWS while minimizing vulnerabilities, maintaining compliance, and enforcing secure-by-default practices. The solution involved deploying a Red Hat Enterprise Linux (RHEL) instance hardened according to OWASP security principles.

This project includes automated setup of VPC networking, IAM roles, security groups, and a hardened RHEL EC2 instance. Key protections include SSH restriction, SELinux configuration, fail2ban, automatic security updates, limited root access, and host-based intrusion detection. All security events are logged to AWS CloudWatch.

This project simulates real-world secure deployment standards and supports best practices aligned with OWASP Top 10, NIST 800-53 SI-4/AC-6, and PCI-DSS 6.5 guidelines.

