resource "google_storage_bucket" "secure_data" {
  name          = "project-3d116623-b2e3-4d71-83e-dev-secure-data"
  location      = "US"
  force_destroy = false

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}
