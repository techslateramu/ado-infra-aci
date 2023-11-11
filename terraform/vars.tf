variable "environment" { default = "dev" }              # should be coming from env folder for ex: tst.tfvars
variable "tags" {
    default = {
        "MainProject" = "TechSlate"
        "SubProject"  = "Containers"
    }
}

variable "ARM_SUBSCRIPTION_ID"  {}
variable "ARM_TENANT_ID"        {}
variable "ARM_CLIENT_ID"        {}
variable "ARM_CLIENT_SECRET"    {}

variable "specific_tags"        { default = {} }
variable "main_project"         { default = "calc" }
variable "sub_project"          { default = "01" }
variable "location"             { default = "uksouth" } # https://github.com/claranet/terraform-azurerm-regions/blob/master/regions.tf