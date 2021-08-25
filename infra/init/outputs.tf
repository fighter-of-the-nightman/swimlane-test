output "tf_state_bucket" {
  value = aws_s3_bucket.tf_state.id
}

output "tf_state_bucket_name" {
  value = aws_s3_bucket.tf_state.bucket
}

output "tf_state_dynamo_table" {
  value = aws_dynamodb_table.tf_state_lock.name
}
