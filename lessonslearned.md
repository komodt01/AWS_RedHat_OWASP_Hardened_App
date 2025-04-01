# Lessons Learned

## Subscription Requirements
Red Hat requires a valid subscription to install security tools like Fail2Ban.

## IAM Role vs Instance Profile
Creating a role does not automatically apply to EC2. Use `associate-iam-instance-profile`.

## Log Permissions
CloudWatch logs required `logs:GetLogEvents` and full access permissions in IAM role.

## Regional & Profile Pitfalls
Commands failed due to missing `--region` or credentials when run inside the EC2 instead of AWS CLI.

## SSH Access Restriction
Restricted access to port 22 using `aws ec2 authorize-security-group-ingress` with a /32 CIDR.

## AMI Query Fixes
Errors were caused by malformed JMESPath syntax when listing AMIs.
