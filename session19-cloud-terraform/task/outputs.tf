output "website_url" {
  description = "HTTP URL for the demo web page after the EC2 instance finishes bootstrapping."
  value       = "http://${aws_instance.web.public_ip}"
}

output "instance_id" {
  description = "ID of the demo EC2 instance."
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "Public IPv4 address assigned to the demo EC2 instance."
  value       = aws_instance.web.public_ip
}

output "vpc_id" {
  description = "ID of the project VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet containing the EC2 instance."
  value       = aws_subnet.public.id
}

output "web_security_group_id" {
  description = "ID of the web security group."
  value       = aws_security_group.web.id
}

output "s3_bucket_name" {
  description = "Name of the private, versioned S3 assets bucket."
  value       = aws_s3_bucket.assets.bucket
}

output "s3_bucket_arn" {
  description = "ARN of the private, versioned S3 assets bucket."
  value       = aws_s3_bucket.assets.arn
}
