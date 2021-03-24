# 0-Bootstrap

In order to maintain the state of the infrastructure being deployed via terraform we will need to create a GCP storage bucket for the terraform state file to live in.

To begin the user running the commands will need to meet the following prerequisites.

## Prerequisites

- gcloud sdk >= 206.0.0
- gsutil

## Process

Step 1

Create a project that will hold the storage bucket

'''
export BILLING_ID=<your-billing-id>
export PROJECT_NAME=<storage-project>

gcloud projects create $PROJECT_NAME --organization $BILLING_ID\
'''

Step 2

Associate Project to a Billing ID

Using `gcloud`
```
gcloud beta billing projects link $PROJECT_ID --billing-account=$BILLING_ID
```

Or through the GCP Console [link](https://cloud.google.com/billing/docs/how-to/modify-project#enable_billing_for_a_project)


Step 3

Create Storage Bucket

```
export MY_BUCKET_NAME=<my-unique-bucket-name>

gsutil mb gs://${MY_BUCKET_NAME} -l northamerica-northeast1

```

Once you have the project and bucket created you can proceed to the next step of provisionin the infrastructure.