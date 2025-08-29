# 🚀 AWS CI/CD Demo

> **A full CI/CD pipeline using AWS EC2, CodeDeploy, CodeCommit, and CodeBuild.**

```
Features:
- EC2: Hosts the web app (Nginx) + CodeDeploy agent
- CodeDeploy: Automates deployments to EC2
- CodeCommit: Stores application source code
- CodeBuild: Builds project artifacts

Repository Structure:
AWS-CI-CD/
├── scripts/           # EC2 setup scripts
│   └── setup-ec2.sh   # Installs Nginx & CodeDeploy agent
├── appspec.yml        # CodeDeploy deployment config
├── buildspec.yml      # CodeBuild build instructions
├── index.html         # Sample web app
└── README.md          # This documentation

EC2 Setup Script:
#!/bin/bash
set -euxo pipefail

# Install Nginx
if command -v dnf >/dev/null; then
    dnf update -y && dnf install -y nginx
elif command -v yum >/dev/null; then
    yum update -y && yum install -y nginx
fi

# Enable and start Nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Install CodeDeploy agent
REGION="ap-south-1"
BUCKET="aws-codedeploy-${REGION}"

cd /tmp
curl -O "https://${BUCKET}.s3.${REGION}.amazonaws.com/latest/install"
chmod +x ./install
sudo ./install auto

sudo systemctl enable codedeploy-agent
sudo systemctl start codedeploy-agent
sudo systemctl status codedeploy-agent

Deployment Steps:
1. Push code to CodeCommit:
   git add .
   git commit -m "Initial commit"
   git push origin main
2. Create CodeBuild project (uses buildspec.yml)
3. Create CodeDeploy application & deployment group targeting EC2
4. Push changes → Pipeline deploys automatically

Verification:
- Nginx: curl http://<EC2_PUBLIC_IP>
- CodeDeploy agent: sudo systemctl status codedeploy-agent

IAM Roles:
1. EC2 Role – CodeDeploy agent permissions
2. CodeDeploy Role – Deploys apps to EC2
3. CodeBuild Role – Fetch & build artifacts
4. Pipeline/Service Role – Optional orchestration

References:
- AWS CodeDeploy Guide: https://docs.aws.amazon.com/codedeploy/latest/userguide/welcome.html
- AWS CodeBuild Docs: https://docs.aws.amazon.com/codebuild/latest/userguide/welcome.html
- AWS CodeCommit Docs: https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html
- Nginx Docs: https://nginx.org/en/docs/
```
![Guvi task 5_page-0001](https://github.com/user-attachments/assets/e2fbb69d-cf61-48e6-8ce9-402b750c79fc)
![Guvi task 5_page-0002](https://github.com/user-attachments/assets/3204cf38-15f8-4853-a804-0ff670a11153)
![Guvi task 5_page-0003](https://github.com/user-attachments/assets/0b9d70ae-ec0a-4110-9033-183af5bd5a21)
![Guvi task 5_page-0004](https://github.com/user-attachments/assets/b05d0b82-9b4d-4597-93fb-11cd76b35927)
![Guvi task 5_page-0005](https://github.com/user-attachments/assets/3f6cf86d-e5bf-45d0-9799-cc4fd8f53b22)
![Guvi task 5_page-0006](https://github.com/user-attachments/assets/5067701d-bd0e-46a2-b182-1c51788cf6f6)
![Guvi task 5_page-0007](https://github.com/user-attachments/assets/1c9c2f6d-d0e3-4bd0-acd5-910ba0420c52)
![Guvi task 5_page-0008](https://github.com/user-attachments/assets/eca2f196-2c50-4982-a580-fc093269585d)
![Guvi task 5_page-0009](https://github.com/user-attachments/assets/104cd29a-2668-4d4e-83b1-19efefd858d7)










