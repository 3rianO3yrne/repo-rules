# What
Terraform to apply Github repo branch protection rules for all public un-archived repos where you are the owner.

To use for private repositories, upgrade to GitHub Pro or make the repository public to enable this feature. (This is a limitation set by Github)

# Requirements
* Terraform
* A github repo of which you are owner
* Your github username
* A Github [personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)


# Usage
* clone repo
* copy the `terraform.tfvars-example` file and change the name to `terraform.tfvars`
* update `terraform.tfvars` with the appropriate values
* run init: `terrafom init`
* run plan: `terraform plan -out tfplan`
* apply plan: `terraform apply tfplan`


