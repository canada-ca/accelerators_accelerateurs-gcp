# GCP Accelerator Templates

## Prerequisites

- gcloud sdk >= 206.0.0
- gsutil
- Terraform


## Stages

### Stage 0 - Bootstrap

In this stage you will need to create a project with a valid billing account and a storage bucket for the terraform state to be stored in.

### Stage 1 - Common Resources

This stage you will deploy the resources listed below using the infrastructure as code utility Terraform

- Folder and project
- BigQuery Instance for log aggregation
- Log export to BigQuery
- Storage Bucket for Log storage
- Log Export to Storage
- BiqQuery Instance for Billing Data
- Pub/Sub instance for recieving Logs
- The following IAM accounts
    - Audit Config for the Org and Project
    - BQ Log User
    - BQ Data Viewer
    - Billing BQ User
    - Billing BQ Viewer
    - SSC Billing Viewer
    - Billing Viewer
- Org Policies
    - Resource Location Constraint to prevent resources from being created outside of Canada

### Stage 2 - Business Resources

This stage will deploy the folders and projects for business units to work from.

## How does using this help enforce the 30 Day Guardrails?

Creates the logging and monitoring resources required by Guardrails #4, 11

Creates the base networking and firewall rules to comply with Guardrails #8,9

Creates and Organization Policy to prevent resources from being deployed outside of the Canadian Region (`northamerica-northeast1`) to comply with Guardrail #5.