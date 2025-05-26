
# This Terraform configuration file enables the necessary APIs for a Google Cloud project.
# It includes the Compute Engine API and the Google Kubernetes Engine API.
# The `google_project_service` resource is used to enable these APIs for the specified project.
# The `disable_on_destroy` argument is set to false, which means that the APIs will not be disabled when the Terraform configuration is destroyed.
resource "google_project_service" "api" {
  # Enable the necessary APIs for the project
  # The `for_each` argument is used to iterate over the list of APIs defined in the `locals` block
  # The `service` argument specifies the API to be enabled
  for_each = toset(local.apis)
  service  = each.key
  disable_on_destroy = false
}
