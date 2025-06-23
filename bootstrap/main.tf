provider  "aws" {
  region = var.region
}

resource "aws_s3_bucket" "tf_state" {
  bucket = var.bucket_name
  
  tags = {
    Name        = "terraform-state-dev"
    Environment = "dev"
    }
}

resource  "aws_s3_bucket_versioning" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
     status = "Enabled"
   }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id

  rule {
   apply_server_side_encryption_by_default {
     sse_algorithm = "AES256"
   }
 }
}


resource  "aws_dynamodb_table" "tf_lock" {
  name          = var.dynamodb_table
  billing_mode  = "PAY_PER_REQUEST"
  hash_key      = "LockID"

  attribute {
   name ="LockID"
   type = "S"
    }

   tags = {
     Name        = "terraform-lock-table"
     Environment = "dev"
   }
}
