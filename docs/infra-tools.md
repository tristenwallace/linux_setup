# Terraform and AWS CLI Setup

## TODO: Review these docs

This guide walks through installing and configuring Terraform and AWS CLI tools.

## AWS CLI Installation

1. Install AWS CLI:

   ```bash
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   unzip awscliv2.zip
   sudo ./aws/install
   ```

2. Verify installation:

   ```bash
   aws --version
   ```

3. Configure AWS credentials:

   ```bash
   aws configure
   ```

   You'll need to enter:
   - AWS Access Key ID
   - AWS Secret Access Key
   - Default region (e.g., us-east-1)
   - Default output format (json)

## Terraform Installation

1. Add HashiCorp GPG key:

   ```bash
   wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
   ```

2. Add HashiCorp repository:

   ```bash
   echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
   ```

3. Update and install Terraform:

   ```bash
   sudo apt update && sudo apt install terraform
   ```

4. Verify installation:

   ```bash
   terraform --version
   ```

## Terraform Configuration

1. Initialize a new Terraform project:

   ```bash
   mkdir my-terraform-project
   cd my-terraform-project
   terraform init
   ```

2. Create a basic provider configuration (`provider.tf`):

   ```hcl
   provider "aws" {
     region = "us-east-1"  # or your preferred region
   }
   ```

## Useful Commands

### AWS CLI

- List S3 buckets: `aws s3 ls`
- List EC2 instances: `aws ec2 describe-instances`
- List IAM users: `aws iam list-users`

### Terraform

- Initialize: `terraform init`
- Plan changes: `terraform plan`
- Apply changes: `terraform apply`
- Destroy resources: `terraform destroy`
- Format code: `terraform fmt`
- Validate configuration: `terraform validate`
- Workspace: `terraform workspace list`
- Select workspace: `terraform workspace select <workspace-name>`

## Best Practices

1. Always use version control for Terraform configurations
2. Use terraform workspaces for managing multiple environments
3. Store terraform state files in a remote backend (like S3)
4. Use variables and outputs to make configurations reusable
5. Always review `terraform plan` output before applying changes

## Troubleshooting

### Common AWS CLI Issues

- `AWS credentials not found`: Ensure `aws configure` has been run
- `Region not specified`: Set default region in config or use `--region` flag

### Common Terraform Issues

- `Provider not found`: Run `terraform init`
- `State lock`: Remove `.terraform.tfstate.lock.info` if process was interrupted => `terraform force-unlock <lock-id>`
- `Version conflicts`: Check provider versions in `terraform.tf` 