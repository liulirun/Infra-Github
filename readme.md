## Terraform test cmd

terraform init;terraform validate;terraform plan -var-file="secret.tfvars" -out=tfplan
terraform apply -var-file="secret.tfvars" -auto-approve

terraform validate; terraform test -var-file="secret.tfvars" -test-directory="unit-tests/wip" -verbose
terraform validate; terraform test -var-file="secret.tfvars" -test-directory="e2e-tests/wip"

terraform validate; terraform test -var-file="secret.tfvars" -test-directory="e2e-tests" -plan_options.refresh=false

## Terragrunt test cmd

cd C:\kobo\Infra-Github\terragrunt\test
 go mod init examples; go mod tidy
 go test -v -timeout 30m