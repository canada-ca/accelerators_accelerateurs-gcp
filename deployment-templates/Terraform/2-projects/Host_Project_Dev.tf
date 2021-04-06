### DEV Host Project in the Shared VPC setup#######


resource "random_id" "default-project-id" {
  byte_length = 2
  prefix      = "host-dev"
}

resource "google_project" "host" {
  name            = var.project_name
  project_id      = random_id.default-project-id.hex
  folder_id       = google_folder.ProB_dev.name
  billing_account = var.billing_account
  auto_create_network  = false
}

resource "google_project_service" "host" {
  project  = google_project.host.project_id

  service = "compute.googleapis.com"
  disable_on_destroy = false
}

data "google_iam_policy" "network-users" {
  binding {
    role    = "roles/compute.networkUser"
    members = "${var.network_users}"
  }
}

resource "google_project_iam_policy" "network-users" {
  project     =  google_project_service.host.project
  policy_data = data.google_iam_policy.network-users.policy_data
}

resource "google_compute_shared_vpc_host_project" "host" {
  project = google_project_service.host.project

  depends_on = [google_project_service.host]
}

resource "google_compute_network" "svc_network" {
  project                 = "${google_project.host.project_id}"
  name                    = "svc-network"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "service" {
  project                  = "${google_project.host.project_id}"
  ip_cidr_range            = "${var.subnet_cidr_dev}"
  name                     = "service-zone"
  network                  = "${google_compute_network.svc_network.name}"
  region                   = "${var.default_region}"
  private_ip_google_access = true
}
