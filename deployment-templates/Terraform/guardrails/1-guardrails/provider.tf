/*provider "google" {
  alias   = "gcp-provider"
  region  = var.default_region
}*/

# https://cloud.google.com/blog/topics/developers-practitioners/using-google-cloud-service-account-impersonation-your-terraform-code
provider "google" {
  alias = "impersonate"
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}
provider "google-beta" {
  alias = "impersonate"
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}
provider "google" {
  access_token = data.google_service_account_access_token.default.access_token
}
provider "google-beta" {
  access_token = data.google_service_account_access_token.default.access_token

}
provider "null" {

}

data "google_service_account_access_token" "default" {
  provider               = google.impersonate
  target_service_account = local.terraform_service_account
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "3600s"
}

# written from bootstrap.sh via YOUR_SERVICE_ACCOUNT in form SERVICE_ACCOUNT@PROJECT.iam.gserviceaccount.com
locals { terraform_service_account = "YOUR_SERVICE_ACCOUNT" }