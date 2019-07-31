resource "aws_dynamodb_table" "currency-dynamodb-table" {
  provider       = "aws.london"
	name           = "Currency"
  billing_mode   = "PAY_PER_REQUEST"
	hash_key       = "id"

	attribute {
		name = "id"
		type = "N"
	}

	tags = {
		Name = "dynamodb-table-1"
	}

}
