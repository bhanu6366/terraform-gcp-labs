variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "bucket_name" {
  description = "Bucket Name"
  type        = string
}

variable "bucket_location" {
  description = "Bucket Location"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}
variable "db_password" {
  description = "Database Password"
  type        = string
  sensitive   = true
}