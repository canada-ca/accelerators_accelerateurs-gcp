resource "google_logging_organization_sink" "my-sink" {
  name   = "log_sink"
  description = "Organization log sink for guardrails"
  org_id = var.org_id
  

  # Can export to pubsub, cloud storage, or bigquery
  destination = "storage.googleapis.com/${google_storage_bucket.log-bucket.name}"

  # Log all WARN or higher severity messages relating to instances
  filter = "resource.type = gce_instance AND severity >= WARNING"
}

resource "google_storage_bucket" "log-bucket" {
  name = "org_log_sink"
}

resource "google_project_iam_member" "log-writer" {
  role = "roles/storage.objectCreator"

  member = google_logging_organization_sink.my-sink.writer_identity
}