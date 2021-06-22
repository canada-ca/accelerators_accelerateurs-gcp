# Create Administration Resources

This directory contains the necessary resources to provision the common admin resources to help comply with the 30 Day Guardrails

By running this terraform script the following will be created

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