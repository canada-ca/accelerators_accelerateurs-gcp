/************************
Restrict Deployment of Approved geographic Regions
https://github.com/canada-ca/cloud-guardrails/blob/master/EN/05_Data-Location.md
************************/

module "org-policy" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 3.0.2"

  constraint        = "constraints/gcp.resourceLocations"
  policy_type       = "list"
  organization_id   = var.org_id
  allow             = var.allowed_regions
  allow_list_length = 1
  #exclude_folders   = [""] 
  #exclude_projects  = [""]
  policy_for = "organization"
}

