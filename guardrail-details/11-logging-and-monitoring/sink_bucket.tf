module "bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "~> 1.3"

  name       = "org_log_sink"
  project_id = var.monitoring_project_id
  location   = var.location
  iam_members = [{
    role   = "roles/storage.viewer"
    member = "user:monitoring@who.com"
  }]
}
