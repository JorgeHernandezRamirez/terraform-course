```
cd terraform
ssh-keygen -f mykey

BUCKET_NAME=jorgehernandezramirez-terraform
TF_STATE=dev/terraform.tfstate
AWS_REGION=eu-west-1

terraform init \
-backend-config="bucket=${BUCKET_NAME}" \
-backend-config="key=${TF_STATE}" \
-backend-config="region=${AWS_REGION}" 

terraform plan -out plan.out
terraform apply plan.out
```