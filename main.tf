resource "google_storage_bucket" "secure_data" {
  name          = "project-3d116623-b2e3-4d71-83e-dev-secure-data"
  location      = "US"
  force_destroy = false

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}
module "storage" {
  source = "./modules/storage"   

  project_id  = var.project_id   
  region      = var.region       
  bucket_name = "my-app-assets-bucket"
  labels = {
    environment = "dev"
    team        = "platform"
  }
}
data "google_secret_manager_secret_version" "app_secret" {
  project = "project-3d116623-b2e3-4d71-83e"
  secret  = "app-seceret"
  version = "latest"
}
