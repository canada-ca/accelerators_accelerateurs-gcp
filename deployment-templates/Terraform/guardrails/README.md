# GCP Accelerator Templates

## Prerequisites

- gcloud sdk >= 206.0.0
- gsutil
- Terraform
- git
- Google Cloud Organization

## Setting up your Environment

For the easiest path we recommend using Google Cloud Shell to run the deployment as all of the above dependancies are already provided.

You can access Cloud Shell from the GCP console by clicking console icon in the top right corner

*insert screen shot*

This will provision an environment for you to run the commands in.

```
git clone https://github.com/cartyc/accelerators_accelerateurs-gcp.git
git checkout landingzone-update # temp until merged into main
cd accelerators_accelerateurs-gcp/deployment-templates/Terraform/guardrails/
``` 

### Stage 0 - Bootstrap

This stage includes a bootstrap shell script which will create the following resources needed to run the Terraform Scripts in Stage 1.

- Project to store the Seed Project Resources
- Service Account for Terraform with the following permissions
    - roles/billing.user
    - roles/compute.networkAdmin
    - roles/compute.xpnAdmin
    - roles/iam.organizationRoleAdmin
    - roles/orgpolicy.policyAdmin
    - role/resourcemanager.folderAdmin
    - roles/resourcemanager.organizationAdmin
    - roles/resourcemanager.projectCreator
    - roles/resourcemanager.projectDeleter
    - roles/resourcemanager.projectIamAdmin
    - roles/resourcemanager.projectMover
    - roles/orgpolicy.PolicyAdmin
    - roles/logging.configWriter
    - roles/resourcemanager.projectIamAdmin
    - roles/serviceusage.serviceUsageAdmin
    - roles/bigquery.dataEditor
    - roles/storage.admin
- Storage Bucket to store the terraform state file for the Guardrails scripts
    - This will be needed to run the Guardrails scripts. The default name for this bucket is `guardrails-asset-bkt`.

To run the bootstrap script you will need access to a Linux VM with the [gcloud](https://cloud.google.com/sdk/gcloud) CLI and Org Admin permissions. 

To execute the bootstrap script run the following command and populate the ENV Vars with the correct data. 

```
DEPT_NAME=<your-department-name>
ORG_ID=<your-gcp-org-id>
BILLING_ID=<your-billing-id>
sh 0-bootstrap/bootstrap.sh -d '${DEPT_NAME}' -o $ORG_ID -b '${BILLING_ID}'
```

### Stage 1 - Common Resources

This stage you will deploy the resources listed below using the infrastructure as code utility Terraform to provide the base needed to deploy the 30 Guardrails.

- Guardrails Project
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
    - Cloud Asset Inventory Viewer
    - Org Policies
    - Resource Location Constraint to prevent resources from being created outside of Canada

## How does using this help enforce the 30 Day Guardrails?

Creates the logging and monitoring resources required by Guardrails #4, 11

Creates the base networking and firewall rules to comply with Guardrails #8,9

Creates and Organization Policy to prevent resources from being deployed outside of the Canadian Region (`northamerica-northeast1`) to comply with Guardrail #5.

## Next Steps

Now that you have a baseline infrastructure set up for the guardrails you can now run the Guardrails Validator tool. Instructions for how to install and run the validator can be found [here](https://github.com/canada-ca/cloud-guardrails-gcp/blob/main/guardrails-validation/README.md)