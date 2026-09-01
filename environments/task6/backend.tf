terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-fullstack"
    storage_account_name = "stfullstackcicd2026"
    container_name       = "tfstate"
    key                  = "task6.tfstate"

    use_azuread_auth = true
    use_oidc         = true
  }
}