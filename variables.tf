variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP deployment region"
  type        = string
  default     = "asia-south1"
}

variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition = contains(
      ["dev", "staging", "prod"],
      var.environment
    )
    error_message = "Environment must be dev, staging or prod."
  }
}

variable "network_name" {
  type    = string
  default = "enterprise-vpc"
}

variable "subnet_cidr" {
  type    = string
  default = "10.10.0.0/24"
}

variable "vault_address" {
  description = "HashiCorp Vault endpoint"
  type        = string
  sensitive   = true
}