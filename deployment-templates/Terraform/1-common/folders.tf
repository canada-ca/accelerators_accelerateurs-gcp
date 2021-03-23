module "folders" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 3.0"

  parent  = "organizations/${var.org_id}"

  names = [
    "common"
  ]

  set_roles = true

  per_folder_admins = {
    common = "group:gcp-developers@domain.com"
  }

  # all_folder_admins = [
  #   "group:gcp-security@domain.com",
  # ]

  folder_admin_roles = [
    "roles/owner",
    "roles/resourcemanager.folderViewer",
    "roles/resourcemanager.projectCreator",
    "roles/compute.networkAdmin",
    "roles/pubsub.viewer"
  ]

}