module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.0"

  name = "novasphere-${var.environment}"
  cidr = "10.0.0.0/16"

  azs            = ["us-east-1a", "us-east-1b"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  # facturee a l'heure, inutile sans subnet prive
  enable_nat_gateway = false
  # sans NAT, les instances ont besoin d'une IP publique pour apt et SSM
  map_public_ip_on_launch = true
}
