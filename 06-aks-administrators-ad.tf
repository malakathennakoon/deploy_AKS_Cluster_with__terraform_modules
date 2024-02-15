# Create Azure AD group in Azure active Directory for AKS admins

resource "azuread_group" "aks_administrators" {
  display_name     = "${module.resource_group.rg_name_out}-cluster-administrators"
  security_enabled = true
  description = "Azure AKS k8s administrators for ${module.resource_group.rg_name_out}-cluster"
}