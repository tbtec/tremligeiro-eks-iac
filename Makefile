init:
	@cd tf \
		&& terraform init -reconfigure

plan:
	@cd tf \
		&& terraform plan -var-file=config.tfvars

delete:
	@cd tf \
		&& rm -r .terraform \
		&& rm .terraform.lock.hcl

apply:
	@cd tf \
		&& terraform apply 

destroy:
	@cd tf \
		&& terraform destroy -auto-approve