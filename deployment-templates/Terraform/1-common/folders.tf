module "folders" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 3.0"

  parent  = "organizations/${var.org_id}"

  names = [
    "adminstration"
  ]

  set_roles = true

  per_folder_admins = {
    common = "group:${var.admin_group_users}" #"group:gcp-developers@domain.com"
  }

  all_folder_admins = [
    "group:${var.billing_data_users}",
  ]

  folder_admin_roles = [
    "roles/owner",
    "roles/resourcemanager.folderViewer",
    "roles/resourcemanager.projectCreator",
    "roles/compute.networkAdmin",
    "roles/pubsub.viewer"
  ]

}