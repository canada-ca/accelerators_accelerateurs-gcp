# Create GCP Folder structure
# Creates 2 tier folder structure
# Tier 1 --> Dev/Test/Prod


# Top-level folder DEV Under organization
resource "google_folder" "DEV" {
  display_name = "DEV-1"
  parent       = "organizations/${var.org_id}"
#set_roles         = true
#  per_folder_admins = var.per_folder_admins
#  all_folder_admins = var.all_folder_admins
}

# Top-level folder PROD Under organization
resource "google_folder" "PROD" {
  display_name = "PROD-1"
  parent       = "organizations/${var.org_id}"
#set_roles         = true
#  per_folder_admins = var.per_folder_admins
#  all_folder_admins = var.all_folder_admins
}

# Top-level folder TEST  Under organization
resource "google_folder" "TEST" {
  display_name = "TEST-1"
  parent       = "organizations/${var.org_id}"
#set_roles         = true
#  per_folder_admins = var.per_folder_admins
#  all_folder_admins = var.all_folder_admins
}







