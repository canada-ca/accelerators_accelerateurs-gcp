module "administration"{
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 10.1"
  random_project_id           = "true"
  #impersonate_service_account = var.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "guardrails"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  # folder_id                   = module.folders.id
  activate_apis               = ["logging.googleapis.com", "bigquery.googleapis.com", "billingbudgets.googleapis.com", "cloudasset.googleapis.com"]

  labels = {
    environment       = "production"
    application_name  = "org-logging"
    billing_code      = "1234"     # Replace
    primary_contact   = "example1" # Replace
    secondary_contact = "example2" # Replace
    business_code     = "abcd"     # Replace
    env_code          = "p"        # Replace
  }

}
