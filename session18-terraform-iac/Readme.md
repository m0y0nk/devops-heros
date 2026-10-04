# Install Terraform

Install Terraform by following the [official Terraform CLI installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).

For an introduction to using Terraform with AWS, see the [official AWS getting-started tutorial](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-create).

## Install the AWS CLI

Follow the [official AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

## Configure AWS credentials safely

Never add AWS access keys or secret access keys to a README, source file, or Git commit. Configure credentials locally with an AWS CLI profile or use an approved IAM role/identity provider. Verify the active identity with:

```bash
aws sts get-caller-identity
```

Do not commit local credential files or Terraform state files; keep them out of version control.
