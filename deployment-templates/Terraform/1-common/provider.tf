
provider "google" {
  alias   = "gcp-provider"
  version = "~> 3.30"
  region  = var.default_region
}