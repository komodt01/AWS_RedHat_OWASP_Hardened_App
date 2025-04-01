# AWS RedHat OWASP Hardened Web App

This project sets up a Red Hat EC2 instance configured as a web server following OWASP security best practices. The EC2 is hardened, logs are sent to CloudWatch, and access is restricted to a trusted IP.

## Project Highlights

- Deployed RHEL EC2 instance with Apache
- Configured VPC, Subnet, IGW, Route Table, Security Group
- Hardened EC2 (SSH restricted, root login disabled, fail2ban pending)
- IAM Role with least privilege
- CloudWatch agent and log stream integrated
- Terraform and manual commands tracked
- Lessons Learned tracked below

---

## Lessons Learned

### 1. Red Hat Subscription Required
Fail2Ban and security packages require entitlement registration. A Red Hat subscription or use of alternatives like Ubuntu may be necessary.

### 2. AMI Query Syntax
Incorrect JMESPath syntax caused AMI queries to fail. Resolved by querying `Images[*].[ImageId,Name]`.

### 3. SSH Access IP Restriction
Limiting SSH to a specific CIDR improved security. Required retrieving and applying trusted IP to the SG.

### 4. Role Attachment Requires IAM Profile
Creating an IAM Role is not sufficient—you must attach it via instance profile and verify `assume-role` trust policy.

### 5. CloudWatch Logs & IAM Permissions
The EC2 IAM role needed CloudWatchLogsFullAccess to allow logs to be pushed from CloudWatch Agent.

### 6. Terraform Planning Order
When mapping infrastructure to Terraform:
- VPC ➝ Subnet ➝ IGW ➝ Route Table ➝ Security Group ➝ EC2 ➝ IAM ➝ CloudWatch ➝ Apache

### 7. Region and Resource Awareness
Always specify `--region` and track resource names and IDs, especially when working manually and in Terraform.
