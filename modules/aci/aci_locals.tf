locals {
  prefix  = "aci"
  aci_name = "${local.prefix}-${module.azure_region.location_short}-${var.environment}-${var.main_project}-${var.sub_project}"
}