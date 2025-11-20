# Cost Optimization – AWS RedHat OWASP Hardened Web App

This document captures the cost considerations and optimization strategies for the **AWS RedHat OWASP Hardened Web App** lab.

---

## 1. High-Level Cost Drivers

- **Compute**
  - One RHEL-based EC2 instance (t3.micro or t3.small recommended).
- **Storage**
  - Single gp3 or gp2 EBS root volume (20–30 GB).
- **Networking**
  - Standard data transfer for inbound/outbound traffic.
- **Logging & Monitoring**
  - CloudWatch Logs ingestion and storage.
  - CloudWatch metrics and alarms.

---

## 2. Instance Selection & Rightsizing

- Use a **t3.micro** for light testing or **t3.small** if additional headroom is required.
- Keep CPU utilization and memory usage under observation through CloudWatch:
  - If CPU is consistently < 10%, consider downsizing.
  - If CPU or memory is consistently high, consider temporary upsize only during testing windows.

---

## 3. Operating System Choice (RHEL vs Amazon Linux)

- **RHEL** provides enterprise-grade support but may incur additional licensing or subscription costs.
- For a **cost-optimized lab or portfolio demonstration**, document the option to:
  - Re-create the same architecture using **Amazon Linux 2** to avoid RHEL subscription costs.
- Clearly state in `README.md` that the project was paused or constrained due to RHEL subscription requirements, to show awareness of licensing cost impact.

---

## 4. Storage & Logs

- Use **gp3** for the root EBS volume where available; it is generally more cost-effective than gp2.
- Set CloudWatch Logs retention to a reasonable default for labs, e.g.:
  - **14–30 days** for this project.
- Avoid very long log retention for non-production workloads to keep storage cost predictable.

---

## 5. Monitoring and Budgets

- Tag all resources with:
  - `Project = "AWS-RedHat-OWASP-Hardened-App"`
  - `Environment = "Lab"`
  - `Owner = "<YourName>"`
- Create an **AWS Budget** (monthly) filtered by project tag where possible, or by account if tag-based budgets are not used:
  - Set a low threshold (e.g., **$10–$25/month**) for this lab.
  - Configure email alerts when:
    - Actual cost exceeds 80% of the budget.
    - Forecasted cost is expected to exceed the budget.

---

## 6. Start/Stop and Teardown Practices

- When not in use, **stop** the EC2 instance to avoid compute charges while retaining the EBS volume.
- Document a **teardown procedure**:
  - `terraform destroy` to remove all infrastructure when the lab is complete.
  - Confirm deletion of:
    - EC2 instance
    - Security groups
    - VPC, subnets, and IGW (if dedicated)
    - CloudWatch log groups (optional if you want to keep logs temporarily)

---

## 7. Future Optimization Opportunities

- Add **Auto Scaling Group** and **scheduled scaling** only if you expand the project to support more traffic.
- Integrate **CloudFront + S3** in a later iteration for static content, offloading some traffic from the EC2 instance.
- Explore using **Savings Plans** or **Reserved Instances** only if the environment becomes long-lived or production-like (not typical for this lab).
