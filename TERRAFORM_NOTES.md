# Terraform Setup Notes

## Resources Deployed Manually
- VPC: aws-redhat-owasp-vpc
- Subnet: aws-redhat-owasp-subnet
- Internet Gateway
- Route Table
- Security Group: ssh + https only from trusted CIDR
- EC2 Instance: RHEL, Apache installed
- IAM Role: aws-owasp (attached via instance profile)
- CloudWatch Agent installed and logging to /aws/honeypot/cowrie

## Planned Terraform Modules
- `vpc.tf`
- `subnet.tf`
- `igw.tf`
- `route_table.tf`
- `security_group.tf`
- `ec2.tf`
- `iam.tf`
- `cloudwatch.tf`
