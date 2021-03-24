variable "org_id" {
  description = "The organization id for the associated services"
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}

variable "terraform_service_account" {
  description = "Service account email of the account to impersonate to run Terraform."
  type        = string
}

variable "skip_gcloud_download" {
  description = "Whether to skip downloading gcloud (assumes gcloud is already available outside the module. If set to true you, must ensure that Gcloud Alpha module is installed.)"
  type        = bool
  default     = false
}

variable "parent_folder" {
  description = "The resource name of the parent Folder or Organization"
  default = ""
}

variable "default_region" {
  description = "Default region for BigQuery resources."
  type        = string
  default = "northamerica-northeast1"
}

variable "dns_hub_project_alert_spent_percents" {
  description = "A list of percentages of the budget to alert on when threshold is exceeded for the DNS hub project."
  type        = list(number)
  default     = [0.5, 0.75, 0.9, 0.95]
}

variable "dns_hub_project_alert_pubsub_topic" {
  description = "The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the DNS hub project."
  type        = string
  default     = null
}

variable "org_audit_logs_project_budget_amount" {
  description = "The amount to use as the budget for the org audit logs project."
  type        = number
  default     = 1000
}

variable "org_billing_logs_project_alert_spent_percents" {
  description = "A list of percentages of the budget to alert on when threshold is exceeded for the org billing logs project."
  type        = list(number)
  default     = [0.5, 0.75, 0.9, 0.95]
}

variable "org_billing_logs_project_alert_pubsub_topic" {
  description = "The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the org billing logs project."
  type        = string
  default     = null
}

variable "org_billing_logs_project_budget_amount" {
  description = "The amount to use as the budget for the org billing logs project."
  type        = number
  default     = 1000
}

variable "org_audit_logs_project_alert_spent_percents" {
  description = "A list of percentages of the budget to alert on when threshold is exceeded for the org audit logs project."
  type        = list(number)
  default     = [0.5, 0.75, 0.9, 0.95]
}

variable "org_audit_logs_project_alert_pubsub_topic" {
  description = "The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the org audit logs project."
  type        = string
  default     = null
}

variable "log_export_storage_force_destroy" {
  description = "(Optional) If set to true, delete all contents when destroying the resource; otherwise, destroying the resource will fail if contents are present."
  type        = bool
  default     = false
}

variable "log_export_storage_retention_policy" {
  description = "Configuration of the bucket's data retention policy for how long objects in the bucket should be retained."
  type = object({
    is_locked             = bool
    retention_period_days = number
  })
  default = null
}

variable "log_export_storage_location" {
  description = "The location of the storage bucket used to export logs."
  type        = string
  default     = "northamerica-northeast1"
}

variable "audit_logs_table_delete_contents_on_destroy" {
  description = "(Optional) If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present."
  type        = bool
  default     = false
}

variable "audit_logs_table_expiration_days" {
  description = "Period before tables expire for all audit logs in milliseconds. Default is 30 days."
  type        = number
  default     = 30
}

variable "billing_data_users" {
  description = "G Suite or Cloud Identity group that have access to billing data set."
  type        = string
}

variable "data_access_logs_enabled" {
  description = "Enable Data Access logs of types DATA_READ, DATA_WRITE and ADMIN_READ for all GCP services. Enabling Data Access logs might result in your organization being charged for the additional logs usage. See https://cloud.google.com/logging/docs/audit#data-access"
  type        = bool
  default     = true
}

variable "audit_data_users" {
  description = "G Suite or Cloud Identity group that have access to audit logs."
  type        = string
}

variable "ssc_data_users" {
  description = "G Suite or Cloud Identity group that have access to SSC requirements."
  type        = string
}

variable "admin_group_users" {
  description = "G Suite or Cloud Identity group that have access to SSC requirements."
  type        = string
}

variable "ssc_broker_users" {
  description = "G Suite or Cloud Identity group that have access to SSC requirements."
  type        = string
}