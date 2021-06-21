resource "google_storage_bucket" "guardrails-bucket" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = true
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
 
  project = module.administration.project_id

}