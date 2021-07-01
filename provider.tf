provider "aws" {
  # Configuration options
  region                  = var.region
  shared_credentials_file = "./.aws/credentials"
}