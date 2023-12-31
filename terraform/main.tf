data "azurerm_client_config" "current" {}

module "resource_group" {
  source                                      = "../modules/resourcegroup"
  environment                                 = var.environment
  location                                    = var.location
  main_project                                = var.main_project
  sub_project                                 = var.sub_project
  tags                                        = merge(var.tags, var.specific_tags)
}

module "container_instance" {
  source                                      = "../modules/containerinstance"
  environment                                 = var.environment
  location                                    = var.location
  main_project                                = var.main_project
  sub_project                                 = var.sub_project
  tags                                        = merge(var.tags, var.specific_tags)
  resource_group_name                         = module.resource_group.name
  container_image                             = var.container_image
  dns_name_label                              = var.dns_name_label
}

