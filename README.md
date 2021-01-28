# GCP Cloud Guardrails

This repository will host the required tooling for deploying a basic GCP environment to be conformant with the the Government of Canada's [Cloud Guardrails Framework](https://github.com/canada-ca/cloud-guardrails).

The deployment terraform files used to deploy the environments are location in the [deployment folder](./deployment) and are based off of the [example organization](https://github.com/terraform-google-modules/terraform-example-foundation) using terraform modules from the [Cloud Foundation Toolkit](https://cloud.google.com/foundation-toolkit).

To deploy the enviornment please follow the processes outlined in the deployment [README](deployment/README.md)

The [guardails](./guardrails) folder contains documentation which describes how compliance with the individual guardrails are achieved.

---

