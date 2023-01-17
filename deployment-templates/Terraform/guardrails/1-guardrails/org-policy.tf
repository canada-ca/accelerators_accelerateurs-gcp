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

/************************
Restrict the Public Marketplace
https://github.com/canada-ca/cloud-guardrails/blob/master/EN/12_Cloud-Marketplace-Config.md
via
https://registry.terraform.io/modules/terraform-google-modules/org-policy/google/latest
************************/
module "org-policy-mkt" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 3.0.2"

  constraint        = "constraints/commerceorggovernance.disablePublicMarketplace"
  policy_type       = "boolean"
  organization_id   = var.org_id
  enforce           = true
  policy_for = "organization"
}
