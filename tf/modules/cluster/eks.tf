data "aws_vpc" "name_vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-tremligeiro"]
  }
}

data "aws_subnet" "name_subnet_a" {
  filter {
    name   = "tag:Name"
    values = ["vpc-tremligeiro-private-us-east-1a"]
  }
}

data "aws_subnet" "name_subnet_b" {
  filter {
    name   = "tag:Name"
    values = ["vpc-tremligeiro-private-us-east-1b"]
  }
}

resource "aws_security_group" "eks_security_group" {
  name        = "eks-security-group"
  description = "EKS security group"
  vpc_id      = data.aws_vpc.name_vpc.id
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "tremligeiro-eks-cluster"
  role_arn = var.role_eks

  vpc_config {
    subnet_ids = [
      data.aws_subnet.name_subnet_a.id,
      data.aws_subnet.name_subnet_b.id,
    ]
  }

  depends_on = [aws_security_group.eks_security_group]
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks-node-group"
  node_role_arn   = var.role_eks
  subnet_ids      = [data.aws_subnet.name_subnet_a.id, data.aws_subnet.name_subnet_b.id]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  depends_on = [aws_eks_cluster.eks_cluster]
}
