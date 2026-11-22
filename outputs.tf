output "project_id" {
  value = var.project_id
}

output "environment" {
  value = var.environment
}

output "vpc_name" {
  value = module.network.network_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "storage_bucket" {
  value = module.storage.bucket_name
}