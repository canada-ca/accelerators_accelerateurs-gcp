variable project_services {
  description = "List of host project services to enable."
  type        = "list"

  default = [
    "compute.googleapis.com",
  ]
}

variable network_users {
  description = "List of network user members for roles/compute.networkUser IAM policy. Typically this would at least include each service project's cloudservices service account in the form of: serviceAccount:PROJECT_NUMBER@cloudservices.gserviceaccount.com."
  type        = "list"
  default     = []
}

variable org_id {
  description = "Organization ID for the host project. Mutually exclusive from var.folder_id."
}

variable project_name {
  description = "Project Name"
  default     = "host"
}


variable service_project_ids {
  description = "List of associated service projects to link with the host project."
  type        = "list"
  default     = []
}



variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}


variable "subnet_cidr_dev" {
  description = "cidr range of subnet to create in the shared VPC of host project"
  type        = string
  default     ="172.20.20.0/24"
}


variable "subnet_cidr_test" {
  description = "cidr range of subnet to create in the shared VPC of host project"
  type        = string
  default     ="172.20.20.0/24"
}


variable "subnet_cidr_prod" {
  description = "cidr range of subnet to create in the shared VPC of host project"
  type        = string
  default     ="172.20.20.0/24"
}


variable "default_region" {
  description = "Default region for BigQuery resources."
  type        = string
  default = "northamerica-northeast1"
}

variable "terraform_service_account" {
  description = "Service account email of the account to impersonate to run Terraform."
  type        = string
}