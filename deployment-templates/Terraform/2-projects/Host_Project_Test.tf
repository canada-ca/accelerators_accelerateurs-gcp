### DEV Host Project in the Shared VPC setup#######


resource "random_id" "default-project-id-test" {
  byte_length = 2
  prefix      = "host-test"
}

resource "google_project" "host_test" {
  name            = "${var.project_name}-Test"
  project_id      = random_id.default-project-id-test.hex
  folder_id       = google_folder.ProB_Test.name
  billing_account = var.billing_account

  auto_create_network  = false
}

resource "google_project_service" "host_test" {
  project  = "${google_project.host_test.project_id}"

  service = "compute.googleapis.com"
  disable_on_destroy = false
}

data "google_iam_policy" "network-users-test" {
  binding {
    role    = "roles/compute.networkUser"
    members = "${var.network_users}"
  }
}

resource "google_project_iam_policy" "network-users-test" {
  project     = "${google_project_service.host_test.project}"
  policy_data = "${data.google_iam_policy.network-users-test.policy_data}"
}

resource "google_compute_shared_vpc_host_project" "host_test" {
  project = "${google_project_service.host_test.project}"

  depends_on = ["google_project_service.host_test"]
}

resource "google_compute_network" "svc_network_test" {
  project                 = "${google_project.host_test.project_id}"
  name                    = "svc-network"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "service_test" {
  project                  = "${google_project.host_test.project_id}"
  ip_cidr_range            = "${var.subnet_cidr_test}"
  name                     = "service-zone"
  network                  = "${google_compute_network.svc_network_test.name}"
  region                   = "${var.default_region}"
  private_ip_google_access = true
}
