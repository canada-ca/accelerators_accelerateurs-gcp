###########FOLDERS UNDER DEV PARENT FOLDER############


# ProB Folder  nested under another folder.
resource "google_folder" "ProB_dev" {
  display_name = "ProtectedB_Dev-2"
  parent       = google_folder.DEV.name
#set_roles         = true
#  per_folder_admins = var.per_folder_admins
#  all_folder_admins = var.all_folder_admins
}


# Unclass Folder  nested under another folder.
resource "google_folder" "Unclass" {
  display_name = "Unclassified_Dev"
  parent       = google_folder.DEV.name
#set_roles         = true
#  per_folder_admins = var.per_folder_admins
#  all_folder_admins = var.all_folder_admins
}



###########FOLDERS UNDER TEST PARENT FOLDER############


# ProB Folder  nested under TEST folder.
resource "google_folder" "ProB_Test" {
  display_name = "ProtectedB_Test"
  parent       = google_folder.TEST.name
#set_roles         = true
#  per_folder_admins = var.per_folder_admins
#  all_folder_admins = var.all_folder_admins
}


# Unclass Folder  nested under another folder.
resource "google_folder" "Unclass_Test" {
  display_name = "Unclassified_Tes-1"
  parent       = google_folder.TEST.name
#set_roles         = true
#  per_folder_admins = var.per_folder_admins
#  all_folder_admins = var.all_folder_admins
}



###########FOLDERS UNDER PROD PARENT FOLDER############


# ProB Folder  nested under another folder.
resource "google_folder" "ProB_Prod" {
  display_name = "ProtectedB_Prod"
  parent       = google_folder.PROD.name
#set_roles         = true
#  per_folder_admins = var.per_folder_admins
#  all_folder_admins = var.all_folder_admins
}


# Unclass Folder  nested under another folder.
resource "google_folder" "Unclass_Prod" {
  display_name = "Unclassified_Prod"
  parent       = google_folder.PROD.name
#set_roles         = true
#  per_folder_admins = var.per_folder_admins
#  all_folder_admins = var.all_folder_admins
}


