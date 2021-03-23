module "common" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 10.1"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "common-base"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = module.folders.id
  activate_apis               = ["logging.googleapis.com", "bigquery.googleapis.com", "billingbudgets.googleapis.com"]

  labels = {
    environment       = "production"
    application_name  = "org-logging"
    billing_code      = "1234"
    primary_contact   = "example1"
    secondary_contact = "example2"
    business_code     = "abcd"
    env_code          = "p"
  }
  
  # budget_alert_pubsub_topic   = var.org_audit_logs_project_alert_pubsub_topic
  # budget_alert_spent_percents = var.org_audit_logs_project_alert_spent_percents
  # budget_amount               = var.org_audit_logs_project_budget_amount
}
