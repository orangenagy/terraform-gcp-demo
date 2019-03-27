# Terraform MIG

## Running instructions
Perform the following to run one service.
1. init
```terraform init -backend-config=conf/dev.conf```
2. plan
```terraform plan -var-file=vars/dev.tfvars -var 'project=<project_id>' -out=dev.plan```
3. apply
```terraform apply dev.plan```
