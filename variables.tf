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
  description = "Database Password (use environment variable: export TF_VAR_db_password='<password>')"
  type        = string
  sensitive   = true
}

variable "ssh_source_ranges" {
  description = "IP ranges allowed for SSH access. IMPORTANT: Customize with your office/VPN IP ranges instead of 0.0.0.0/0"
  type        = list(string)
  default     = ["0.0.0.0/0"] # TODO: Change to your actual IP ranges (e.g., ["203.0.113.0/24"])
}

variable "common_labels" {
  description = "Common labels for all resources"
  type        = map(string)
  default = {
    terraform  = "true"
    team       = "devops"
    managed_by = "terraform"
  }
}

variable "resource_prefix" {
  description = "Prefix for all resource names to support multiple environments"
  type        = string
  default     = ""
}

variable "enable_private_ip" {
  description = "Enable private IP for Cloud SQL (disable public IP for production)"
  type        = bool
  default     = false
}

variable "storage_force_destroy" {
  description = "Allow force destroy of storage buckets (disable for production)"
  type        = bool
  default     = true
}