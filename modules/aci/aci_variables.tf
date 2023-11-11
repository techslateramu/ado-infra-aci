variable "environment" {
  type        = string
  description = "(Required) Custom variable. This the enviorment name where the resouce group will be created."

  validation {
    condition     = var.environment == "dev" || var.environment == "qa" || var.environment == "hub" || var.environment == "uat" || var.environment == "prod" || var.environment == "tst"
    error_message = "Invalid environment name. Should be one of these - dev,qa,hub,uat,prod,tst."
  }
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "main_project" {
  type        = string
  description = "(Required) Custom variable. Main project name."
}

variable "sub_project" {
  type        = string
  description = "(Required) Custom variable. Sub project name."
}

variable "aci_dns_name" {
  description = "DNS name for the Azure Container Instance (optional)"
  type        = string
  default     = "container"
}

variable "aci_tenant_id" {
  description = "Azure AD tenant ID for the Azure Container Instance (optional)"
  type        = string
  default     = null
}

variable "aci_image" {
  description = "Image for the ACI"
  type        = string
}

variable "aci_cpu" {
  description = "CPU configuration for the ACI"
  type        = string
}

variable "aci_memory" {
  description = "Memory configuration for the ACI"
  type        = string
}

variable "aci_environment_variables" {
  description = "Environment variables for the ACI"
  type        = map(string)
  default     = {}
}

variable "aci_ports" {
  description = "Port configuration for the ACI"
  type        = list(object({
    name     = string
    protocol = string
    port     = number
  }))
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
}