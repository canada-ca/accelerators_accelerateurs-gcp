terraform {
  backend "gcs" {
    bucket = "${PROJECT}"
    prefix = "/orgadmin/seeding/"
  }
}