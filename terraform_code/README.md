Terraform 
----------------------------------
1. Download and setup terraform
2. Install AWS CLI
3. Create an IAM User with Programatic Access
4. Configure AWS credentials
5. Install Terraform plugin in VS Code

Terraform installation for Windows:
-----------------------------------
Download latest version of terraform from (https://developer.hashicorp.com/terraform/downloads) and install it.
Advance System Settings --> Advanced --> Environment Variables --> add terraform path

Terraform installation for Linux:
-----------------------------------
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
terraform -version

Create an IAM programmatic user with administrator access - (AWS cloud)
aws configure --> provide all the details
aws s3 ls

vi main.tf
provider "aws" {
  region="us-east-1"
}

Terraform commands
--------------------------------------------------------
terraform init
terraform plan
terraform apply
terraform destroy
