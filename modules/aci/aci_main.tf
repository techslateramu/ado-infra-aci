module "azure_region" {
  source       = "claranet/regions/azurerm"
  version      = ">=6"
  azure_region = var.location
}

resource "azurerm_container_group" "aci" {
  name                = local.aci_name
  resource_group_name = var.resource_group_name
  location            = module.azure_region.location
  # ip_address_type     = "Public"
  os_type             = "Linux"

  container {
    name   = local.aci_name
    image  = var.aci_image
    cpu    = var.aci_cpu
    memory = var.aci_memory

    environment_variables = var.aci_environment_variables

    ports {
      port     = 80
      protocol = "TCP"
    }
    # ports {
    #   internal = var.aci_ports[*].internal
    #   external = var.aci_ports[*].external
    # }
  }

  dns_name_label  = var.aci_dns_name
  tags            = var.tags

  # If tenant_id is provided, set it as the scope
  # identity {
  #   type          = "SystemAssigned"
  #   tenant_id     = var.aci_tenant_id
  # }
}
