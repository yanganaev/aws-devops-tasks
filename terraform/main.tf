provider "aws" {
  region = var.aws_region
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "example" {
  bucket        = "${var.project_name}-bucket-${random_id.bucket_id.hex}"
  force_destroy = true

  tags = {
    Name        = "Example S3 Bucket"
    Environment = var.environment
  }
}
