
# GC Accelerators (GCP)

This repository will host the required tooling for deploying a basic GCP environment to be conformant with the the Government of Canada's [Cloud Guardrails Framework](https://github.com/canada-ca/cloud-guardrails).

The deployment terraform files used to deploy the environments are location in the [deployment folder](./deployment-templates/Terraform) and are based off of the [example organization](https://github.com/terraform-google-modules/terraform-example-foundation) using terraform modules from the [Cloud Foundation Toolkit](https://cloud.google.com/foundation-toolkit).

To deploy the environment please follow the processes outlined in the deployment [README](deployment-templates/README.md)

The [guardails](./guardrail-details) folder contains documentation which describes how compliance with the individual guardrails are achieved.

Currently Available Accelerators
- Guardrails ([link](deployment-templates/Terraform/Guardrails))

---

## How to Contribute

See [CONTRIBUTING.md](CONTRIBUTING.md)

---
## License

Unless otherwise noted, the source code of this project is covered under Crown Copyright, Government of Canada, and is distributed under the [MIT License](LICENSE).

The Canada wordmark and related graphics associated with this distribution are protected under trademark law and copyright law. No permission is granted to use them outside the parameters of the Government of Canada's corporate identity program. For more information, see [Federal identity requirements](https://www.canada.ca/en/treasury-board-secretariat/topics/government-communications/federal-identity-requirements.html).
