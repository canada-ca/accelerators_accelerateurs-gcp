######################################################################
## This Script will perform the below actions
## 1) Create a GCP project directly under the GCP Org
## 2) Provision a Terraform service account with required permissions in the seed project
######################VARIABLES
## 1) Dept naming convention. = This will be suffix of seed project dept-seed-project
## 2) organization and billing IDs will be derived via the supplied bootstrap project-id
##########################USAGE
## bootstrap.sh -d 'dept' -p project-id 
## Before running the script
##
## add roles to super admin user (in addition to Organization Administrator)
## iam.serviceAccountTokenCreator
## Folder Admin
## Organization Policy Admin
## Project Billing Manager
## Project Creator
## optional Security Center Admin and Support Account Administrator
## https://github.com/canada-ca/accelerators_accelerateurs-gcp/issues/24
######################################################################

#!bin/bash

usage()
{
    echo "usage: <command> options:<d|p>"
    echo "syntax: ./bootstrap.sh -d lc_dept_name -p project_id"
    # lower case dept only
    echo "./bootstrap.sh -d ssc -p accelerator-dev"
}

no_args="true"
while getopts "d:p:" flag;
do
    case "${flag}" in
        d) dpt=${OPTARG};;
        p) project_id=${OPTARG};;
        *) usage
           exit 1
           ;;
    esac
    no_args="false"
done

# Exit script and print usage if no arguments are passed.
if [[ $no_args == true ]]; then
    usage
    exit 1
fi
# get org and billing id based on project
org_id=$(gcloud projects get-ancestors $project_id --format='get(id)' | tail -1)
billing_id=$(gcloud alpha billing projects describe $project_id '--format=value(billingAccountName)' | sed 's/.*\///')

seed_project_id="${dpt}-seed-project"
echo "seed project id: $seed_project_id";
echo "boostrap project id: $project_id";
echo "org id: $org_id";
echo "billing id: $billing_id";

act=""

seed_gcp () {

# reset project from seed project - if rerunning script
gcloud config set project "${project_id}"

# verify super admin account has proper roles to use the terraform service account
EMAIL=`gcloud config list account --format "value(core.account)"`
echo "checking roles of current account: ${EMAIL}"
ALL_REQUIRED_SUPER_ADMIN_ROLES_EXIST=""
SERVICE_ACCOUNT_TOKEN_CREATOR_ROLE=`gcloud organizations get-iam-policy $org_id --filter="bindings.members:${EMAIL}" --flatten="bindings[].members" --format="table(bindings.role)" | grep serviceAccountTokenCreator`
if [ -z "$SERVICE_ACCOUNT_TOKEN_CREATOR_ROLE" ]
then
    echo "roles/iam.serviceAccountTokenCreator role missing"
    ALL_REQUIRED_SUPER_ADMIN_ROLES_EXIST="0"
else
    echo "${SERVICE_ACCOUNT_TOKEN_CREATOR_ROLE} role set OK on super admin account"
fi  

SERVICE_ACCOUNT_TOKEN_CREATOR_ROLE=`gcloud organizations get-iam-policy $org_id --filter="bindings.members:${EMAIL}" --flatten="bindings[].members" --format="table(bindings.role)" | grep folderAdmin`
if [ -z "$SERVICE_ACCOUNT_TOKEN_CREATOR_ROLE" ]
then
    echo "roles/resourcemanager.folderAdmin role missing"
    ALL_REQUIRED_SUPER_ADMIN_ROLES_EXIST="0"
else
    echo "${SERVICE_ACCOUNT_TOKEN_CREATOR_ROLE} role set OK on super admin account"
fi  

SERVICE_ACCOUNT_TOKEN_CREATOR_ROLE=`gcloud organizations get-iam-policy $org_id --filter="bindings.members:${EMAIL}" --flatten="bindings[].members" --format="table(bindings.role)" | grep organizationAdmin`
if [ -z "$SERVICE_ACCOUNT_TOKEN_CREATOR_ROLE" ]
then
    echo "roles/resourcemanager.organizationAdmin role missing"
    ALL_REQUIRED_SUPER_ADMIN_ROLES_EXIST="0"
else
    echo "${SERVICE_ACCOUNT_TOKEN_CREATOR_ROLE} role set OK on super admin account"
fi  

if [ -z "$ALL_REQUIRED_SUPER_ADMIN_ROLES_EXIST" ]
then
  echo "all roles set OK on super admin account:  ${EMAIL} - proceeding"
else
  echo "missing roles listed above on the super admin account:  ${EMAIL}"
  exit 1;
fi

tf="tfadmin-${dpt}"

# enable services on current project
echo "enabling pubsub.googleapis.com identitytoolkit cloudresourcemanager iam cloudbilling on $project_id project"
gcloud services enable pubsub.googleapis.com identitytoolkit.googleapis.com cloudresourcemanager.googleapis.com cloudbilling.googleapis.com iam.googleapis.com

#Step1 Create GCP seed Project
PROJ_EXISTS=$(gcloud projects list --filter ${seed_project_id})
if [ -z "$PROJ_EXISTS" ]
then
  gcloud projects create "${seed_project_id}" --organization=${org_id}  --quiet
  # handle project id already exists collision
else
  echo "${seed_project_id} project already exists and will be reused to provision resources"
fi

#Step 2 : Associate billing id with project
gcloud beta billing projects link "${seed_project_id}" --billing-account "${billing_id}" --quiet

#Step 3 Create Terraform service account
TF_SA_EXISTS=$(gcloud iam service-accounts list --project=${seed_project_id} --filter $tf)
if [ -z "$TF_SA_EXISTS" ]
then
  gcloud iam service-accounts create "${tf}" --display-name "Terraform guardrails service account" --project=${seed_project_id} --quiet
  act=`gcloud iam service-accounts list --project="${seed_project_id}" --filter=tfadmin --format="value(email)"`
else
  act=`gcloud iam service-accounts list --project="${seed_project_id}" --filter=tfadmin --format="value(email)"`
  echo "TF SA Already exists as: ${act}"
fi
# handles only 1 SA at a time

sed -i "s/YOUR_SERVICE_ACCOUNT/${act}/g" ../1-guardrails/provider.tf

echo $act
# will show 2+ accounts if rerun with a different name
#Step 4 Assign org level and project level role to TF account
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/billing.admin
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/accesscontextmanager.policyAdmin
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/billing.user
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/compute.networkAdmin
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/compute.xpnAdmin
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/iam.organizationRoleAdmin
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/resourcemanager.folderAdmin
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/resourcemanager.organizationAdmin
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/resourcemanager.projectCreator
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/resourcemanager.projectDeleter
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/resourcemanager.projectMover
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/orgpolicy.policyAdmin
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/logging.configWriter
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/resourcemanager.projectIamAdmin
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/serviceusage.serviceUsageAdmin 
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/bigquery.dataEditor 
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/storage.admin
# only on the super admin account
#gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/iam.serviceAccountTokenCreator
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/iam.serviceAccountAdmin
gcloud organizations add-iam-policy-binding ${org_id}  --member=serviceAccount:${act} --role=roles/pubsub.admin
# Step 5 Create Storage Bucket for Guardrails
echo "gs://${seed_project_id}-guardrails"
# check for existing bucket first - but a ServiceException: 409 is ok on script reentry
gsutil mb -l northamerica-northeast1 -p ${seed_project_id} gs://${seed_project_id}-guardrails
echo "Replace backend.tf bucketname"
sed -i "s/BUCKETNAME/${seed_project_id}-guardrails/g" ../1-guardrails/backend.tf

# Step 6 Grant Current User Accounts to Storage Bucket
USER=$(gcloud config get-value account)
gsutil iam ch user:${USER}:objectCreator "gs://${seed_project_id}-guardrails"

# Step 7 Set Project Context
gcloud config set project "${seed_project_id}"

# Step 8 Set Base `variables.tfvars`
# don't assume the project is off the home dir - it could be off cloudshell_open
# will overwrite the 3 emails on reentry
cp ../1-guardrails/variables.tfvar.example ../1-guardrails/variables.tfvar
sed -i "s/BILLING_ACCOUNT/${billing_id}/g" ../1-guardrails/variables.tfvar
sed -i "s/ORG_ID/${org_id}/g" ../1-guardrails/variables.tfvar
sed -i "s/service-account@email.com/${act}/g" ../1-guardrails/variables.tfvar
sed -i "s/guardrails-asset-bkt/${dpt}-guardrails-assets/g" ../1-guardrails/variables.tfvar
sed -i "s/YOUR_SERVICE_ACCOUNT/${act}/g" ../1-guardrails/provider.tf
echo "wrote TF SA to provider.tf and variables.tfvar along with the bucket, billing account and org id - verify them"

# services to enable on both projects (guardrails and seed)

echo "enabling pubsub identitytoolkit cloudresourcemanager iam cloudbilling on ${seed_project_id} project"
gcloud services enable pubsub.googleapis.com identitytoolkit.googleapis.com cloudresourcemanager.googleapis.com cloudbilling.googleapis.com iam.googleapis.com
gcloud services list --enabled --project "${seed_project_id}" | grep cloudresourcemanager.googleapis.com
gcloud services list --enabled --project "${seed_project_id}" | grep identitytoolkit.googleapis.com
gcloud services list --enabled --project "${seed_project_id}" | grep pubsub.googleapis.com
gcloud services list --enabled --project "${seed_project_id}" | grep cloudbilling.googleapis.com
## set on both seed and guardrails project
gcloud services list --enabled --project "${seed_project_id}" | grep iam.googleapis.com

echo "if you get an iam permission on the guardrails-aaaa project - run gcloud services enable iam.googleapis.com  --project guardrails-nnnn"

}


main () {

seed_gcp
status=$?
echo "Status: ${status}"
if [ $status == 0 ]
then
echo "GCP seed project created project id: ""${seed_project_id} \n"
echo " Terraform Service account to be used for creating GCP landing zone = " "${act} \n"
echo " Terraform Backend Storage Bucket: gs://${seed_project_id}-guardrails" 
#echo " Please follow instructions to setup Terraform service account keys before launching Terraform scripts."
#echo " https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started"
else
echo " GCP service account creation failed. Please debug and rerun"
fi
}

main

