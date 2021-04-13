### DEV Host Project in the Shared VPC setup#######


resource "random_id" "default-project-id-prd" {
  byte_length = 2
  prefix      = "host-prod"
}

resource "google_project" "host_prod" {
  name            = "${var.project_name}-Prod"
  project_id      = random_id.default-project-id-prd.hex
  folder_id       = google_folder.ProB_Prod.name
  billing_account = var.billing_account
  auto_create_network  = false
}

resource "google_project_service" "host_prod" {
  project  = "${google_project.host_prod.project_id}"

  service = "compute.googleapis.com"
  disable_on_destroy = false
}

data "google_iam_policy" "network-users_prod" {
  binding {
    role    = "roles/compute.networkUser"
    members = "${var.network_users}"
  }
}

resource "google_project_iam_policy" "network-users-prod" {
  project     = "${google_project_service.host_prod.project}"
  policy_data = "${data.google_iam_policy.network-users_prod.policy_data}"
}

resource "google_compute_shared_vpc_host_project" "host_prod" {
  project = "${google_project_service.host_prod.project}"

  depends_on = ["google_project_service.host_prod"]
}

resource "google_compute_network" "svc_network_prod" {
  project                 = "${google_project.host_prod.project_id}"
  name                    = "svc-network"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "service_prod" {
  project                  = "${google_project.host_prod.project_id}"
  ip_cidr_range            = "${var.subnet_cidr_prod}"
  name                     = "service-zone"
  network                  = "${google_compute_network.svc_network_prod.name}"
  region                   = "${var.default_region}"
  private_ip_google_access = true

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling = 0.5
    metadata = "INCLUDE_ALL_METADATA"
  }  
}
