# Terraform MIG

## Running instructions
Perform the following to run one service.
1. init
```terraform init -backend-config=conf/dev.conf```
2. plan
```terraform plan -var-file=vars/dev.tfvars -var 'project=<project_id>' -var 'service_account_email=<service_account_email>' -out=dev.plan```
3. apply
```terraform apply dev.plan```
