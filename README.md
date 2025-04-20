# AWS RedHat OWASP Hardened Web App

This project deploys a hardened Red Hat Enterprise Linux (RHEL) EC2 instance configured as a secure web server, adhering to OWASP security best practices. The setup includes a VPC, restricted network access, an IAM role with least privilege, and CloudWatch logging. The project was paused due to Red Hat subscription requirements for installing security tools like Fail2Ban.

## Project Overview

The goal was to create a secure, production-ready web server on AWS using a RHEL EC2 instance running Apache, with infrastructure defined manually and planned for Terraform automation. Key features include:

- **Network Security**: Configured VPC, subnet, Internet Gateway, Route Table, and Security Group restricting SSH and HTTPS to a trusted IP CIDR.
- **Instance Hardening**: Disabled root login, restricted SSH access, and planned Fail2Ban installation (pending subscription).
- **IAM Security**: Created an IAM role with least privilege, attached via an instance profile.
- **Monitoring**: Integrated CloudWatch Agent to stream logs to `/aws/honeypot/cowrie`.
- **Infrastructure Tracking**: Documented manual AWS CLI commands and planned Terraform modules.
- **OWASP Compliance**: Aligned with OWASP guidelines for secure web server configuration.

**Note**: The project was halted due to Red Hat’s subscription requirement for security tools like Fail2Ban. Alternatives like Ubuntu or CentOS are recommended for future iterations.

## Architecture

- **VPC**: `aws-redhat-owasp-vpc`
- **Subnet**: `aws-redhat-owasp-subnet`
- **Internet Gateway**: Attached to VPC
- **Route Table**: Configured for internet access
- **Security Group**: Allows SSH (port 22) and HTTPS (port 443) from a trusted `/32` CIDR
- **EC2 Instance**: RHEL with Apache installed
- **IAM Role**: `aws-owasp`, attached via instance profile with `CloudWatchLogsFullAccess`
- **CloudWatch**: Logs streamed from EC2 to CloudWatch

## Setup Details

The infrastructure was deployed manually using AWS CLI, with plans to automate via Terraform. Key steps included:

1. **VPC and Networking**:

   - Created VPC, subnet, Internet Gateway, and Route Table.
   - Configured Security Group to restrict SSH and HTTPS to a trusted IP.

2. **EC2 Instance**:

   - Launched RHEL EC2 instance.
   - Installed and configured Apache web server.
   - Hardened instance by disabling root login and restricting SSH.

3. **IAM Role**:

   - Created `aws-owasp` role with least privilege.
   - Attached to EC2 via an instance profile.
   - Added `CloudWatchLogsFullAccess` for logging.

4. **CloudWatch**:

   - Installed CloudWatch Agent on EC2.
   - Configured log streaming to `/aws/honeypot/cowrie`.

5. **Terraform Planning**:

   - Planned modules: `vpc.tf`, `subnet.tf`, `igw.tf`, `route_table.tf`, `security_group.tf`, `ec2.tf`, `iam.tf`, `cloudwatch.tf`.
   - Order: VPC → Subnet → IGW → Route Table → Security Group → EC2 → IAM → CloudWatch → Apache.

## Lessons Learned

The project provided valuable insights into AWS and RHEL security configurations:

1. **Red Hat Subscription Limitation**:

   - RHEL requires a subscription to install security tools like Fail2Ban. Consider Ubuntu or CentOS for open-source alternatives.

2. **IAM Role vs. Instance Profile**:

   - An IAM role must be attached to an EC2 instance via an instance profile using `associate-iam-instance-profile`.

3. **CloudWatch Permissions**:

   - EC2 IAM role requires `logs:GetLogEvents` and `CloudWatchLogsFullAccess` to push logs.

4. **SSH Access Restriction**:

   - Used `aws ec2 authorize-security-group-ingress` to limit SSH to a `/32` CIDR, enhancing security.

5. **AMI Query Syntax**:

   - Fixed errors in JMESPath syntax for AMI queries by using `Images[*].[ImageId,Name]`.

6. **Regional and Profile Issues**:

   - Commands failed without `--region` or when credentials were missing on the EC2 instance. Always specify region and verify AWS CLI configuration.

7. **Terraform Planning**:

   - Infrastructure must be mapped in order: VPC → Subnet → IGW → Route Table → Security Group → EC2 → IAM → CloudWatch → Apache.

## Next Steps

To resume or adapt the project:

1. **Switch OS**: Use Ubuntu or CentOS to avoid Red Hat subscription requirements.
2. **Implement Fail2Ban**: Install and configure Fail2Ban on the new OS.
3. **Automate with Terraform**: Convert manual CLI commands into Terraform modules (`vpc.tf`, `ec2.tf`, etc.).
4. **Enhance Hardening**: Add additional OWASP-recommended configurations (e.g., WAF, TLS settings).
5. **Test Logging**: Verify CloudWatch log streams and set up alarms for security events.

## Repository Structure

```
aws_redhat_owasp_hardened_app/
├── README.md               # Project overview and documentation
├── CHANGELOG.md            # Project changelog
├── TERRAFORM_NOTES.md      # Terraform planning notes
└── master                  # Git commit log
```

## Contact

For questions or contributions, contact k_omodt@msn.com.