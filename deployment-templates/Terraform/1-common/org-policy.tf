/************************
Restrict Deployment of Resources to Regions outside of Canada
************************/

module "org-policy" {
  source            = "terraform-google-modules/org-policy/google"
  version           = "~> 3.0.2"

  constraint        = "constraints/gcp.resourceLocations"
  policy_type       = "list"
  organization_id   = var.org_id
  allow = ["northamerica-northeast1","US"]
  allow_list_length = 1
  # exclude_folders   = [""]
  # exclude_projects  = [""]
  policy_for	= "organization"
}

