terraform {
  backend "s3" {
    bucket = "novasphere-tfstate-bor"
    # une cle par environnement
    key     = "novasphere/dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    # verrou natif S3 (dynamodb_table est deprecie)
    use_lockfile = true
  }
}
