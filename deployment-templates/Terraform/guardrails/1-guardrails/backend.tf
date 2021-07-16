terraform {
  backend "gcs" {
    bucket = "BUCKETNAME"
    prefix = "/orgadmin/seeding/"
  }
}