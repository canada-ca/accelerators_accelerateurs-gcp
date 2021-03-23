terraform {
  backend "gcs" {
    bucket = "bootstrap-landingzone"
    prefix = "/orgadmin/seeding/"
  }
}