
# GC Accelerators (GCP)

[![Open this project in Google Cloud Shell](http://gstatic.com/cloudssh/images/open-btn.png)](https://console.cloud.google.com/cloudshell/open?git_repo=https://github.com/fmichaelobrien/accelerators_accelerateurs-gcp&page=editor&tutorial=README.md)

This repository will host the required tooling for deploying a basic GCP environment to be conformant with the the Government of Canada's [Cloud Guardrails Framework](https://github.com/canada-ca/cloud-guardrails).

The deployment terraform files used to deploy the environments are location in the [deployment folder](https://github.com/canada-ca/accelerators_accelerateurs-gcp/tree/main/deployment-templates/Terraform/guardrails/) and are based off of the [example organization](https://github.com/terraform-google-modules/terraform-example-foundation) using terraform modules from the [Cloud Foundation Toolkit](https://cloud.google.com/foundation-toolkit).

To deploy the environment please follow the processes outlined in the deployment [README](deployment-templates/Terraform/guardrails/README.md)

The `guardails-details` folder contains documentation which describes how compliance with the individual guardrails are achieved.

Currently Available Accelerators
- Guardrails ([link](https://github.com/canada-ca/accelerators_accelerateurs-gcp/tree/main/deployment-templates/Terraform/guardrails))

---

## How to Contribute

See [CONTRIBUTING.md](CONTRIBUTING.md)

---
## License

Unless otherwise noted, the source code of this project is covered under Crown Copyright, Government of Canada, and is distributed under the [MIT License](LICENSE).

The Canada wordmark and related graphics associated with this distribution are protected under trademark law and copyright law. No permission is granted to use them outside the parameters of the Government of Canada's corporate identity program. For more information, see [Federal identity requirements](https://www.canada.ca/en/treasury-board-secretariat/topics/government-communications/federal-identity-requirements.html).
