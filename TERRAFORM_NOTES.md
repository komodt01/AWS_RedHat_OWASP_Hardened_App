# Terraform Setup Notes

## Resources Deployed Manually

- **VPC**: `aws-redhat-owasp-vpc`
- **Subnet**: `aws-redhat-owasp-subnet`
- **Internet Gateway**: Attached to VPC
- **Route Table**: Configured for internet access
- **Security Group**: Restricts SSH (port 22) and HTTPS (port 443) to trusted `/32` CIDR
- **EC2 Instance**: RHEL with Apache installed
- **IAM Role**: `aws-owasp`, attached via instance profile with `CloudWatchLogsFullAccess`
- **CloudWatch**: Agent installed, logging to `/aws/honeypot/cowrie`

## Planned Terraform Modules

To automate the infrastructure, the following Terraform modules are planned:

- `vpc.tf`: Define VPC and related components
- `subnet.tf`: Configure subnet
- `igw.tf`: Set up Internet Gateway
- `route_table.tf`: Define routing rules
- `security_group.tf`: Restrict SSH and HTTPS access
- `ec2.tf`: Launch RHEL EC2 instance with Apache
- `iam.tf`: Create and attach IAM role
- `cloudwatch.tf`: Configure CloudWatch Agent and log streams

## Planning Order

- VPC → Subnet → Internet Gateway → Route Table → Security Group → EC2 → IAM → CloudWatch → Apache