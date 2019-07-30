provider "aws" {
  version    = "~> 1.39"
  access_key = "${lookup(var.aws_keys, terraform.workspace)}"
  secret_key = "${lookup(var.aws_secrets, terraform.workspace)}"
  region     = "eu-west-2"
}

provider "aws" {
  alias      = "london"
  access_key = "${lookup(var.aws_keys, terraform.workspace)}"
  secret_key = "${lookup(var.aws_secrets, terraform.workspace)}"
  region     = "eu-west-2"
}
