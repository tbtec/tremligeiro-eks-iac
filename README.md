# Trem Ligeiro EKS (Elastic Kubernetes Service)

This applications is responsible for AWS Elastic Kubernetes Service infrastructure of the restaurant "Trem Ligeiro" from Company "Trem Bão Tecnologia".

## How to run

### Requirements

-   [Make](https://www.gnu.org/software/make/)
-   [AWS CLI](https://aws.amazon.com/pt/cli/)
-   [Terraform 1.11.4](https://developer.hashicorp.com/terraform/install?product_intent=terraform)

### Building 

Use this commands to init local terraform.

```bash
make tf-init
```

### Create locally

Starts applications using:

```bash
make tf-apply
```

### Cloud
Configure GitHub Actions enviroment variables, then, starts DeployInfrascruture workflow.