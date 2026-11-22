resource "google_storage_bucket" "data" {
  name          = var.bucket_name
  project       = var.project_id
  location      = var.region
  storage_class = "STANDARD"

  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  labels = var.labels

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 90
    }

    action {
      type = "Delete"
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}