package terraform.gcp

import rego.v1

deny contains msg if {
    some resource in input.resource_changes
    resource.type == "google_storage_bucket"

    resource.change.after.public_access_prevention != "enforced"

    msg := "GCS bucket must enforce public access prevention"
}

deny contains msg if {
    some resource in input.resource_changes
    resource.type == "google_storage_bucket"

    resource.change.after.uniform_bucket_level_access != true

    msg := "Uniform bucket-level access must be enabled"
}

deny contains msg if {
    some resource in input.resource_changes
    resource.type == "google_compute_network"

    resource.change.after.auto_create_subnetworks == true

    msg := "Automatic subnet creation is prohibited"
}