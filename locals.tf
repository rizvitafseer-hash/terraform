locals {
  common_labels = {
    environment = var.environment
    managed_by  = "terraform"
    project     = "enterprise-iac"
    owner       = "platform-team"
  }

  resource_prefix = "enterprise-${var.environment}"

  production = var.environment == "prod"
}