terraform {
  backend "gcs" {
    bucket = "carty-org-seed-project-guardrails"
    prefix = "/orgadmin/seeding/"
  }
}