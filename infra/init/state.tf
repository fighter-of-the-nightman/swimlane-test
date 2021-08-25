resource "aws_s3_bucket" "tf_log_bucket" {
  bucket = "blakes-tf-log-bucket"
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "blakes-tf-remote-state-files"
  acl    = "private"

  versioning {
    enabled = true
  }

  logging {
    target_bucket = aws_s3_bucket.tf_log_bucket.id
    target_prefix = "log/"
  }

  tags = {
    Name        = "tf-remote-state-files"
    Environment = "Prod"
  }
}

resource "aws_dynamodb_table" "tf_state_lock" {
  name         = "tf-remote-state-files-lock"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "tf-remote-state-files"
    Environment = "Prod"
  }
}
