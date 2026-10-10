variable "organization_connections" {
  description = <<EOT
Map of organization_connections, attributes below
Required:
    - organization_id
    - enabled_connections (block):
        - assign_membership_on_login (optional)
        - connection_id (required)
        - is_enabled (optional)
        - is_signup_enabled (optional)
        - organization_access_level (optional)
        - organization_connection_name (optional)
        - show_as_button (optional)
EOT

  type = map(object({
    organization_id = string
    enabled_connections = list(object({
      assign_membership_on_login   = optional(bool)
      connection_id                = string
      is_enabled                   = optional(bool)
      is_signup_enabled            = optional(bool)
      organization_access_level    = optional(string)
      organization_connection_name = optional(string)
      show_as_button               = optional(bool)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.organization_connections : (
        length(v.enabled_connections) >= 1
      )
    ])
    error_message = "Each enabled_connections list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.organization_connections : (
        alltrue([for item in v.enabled_connections : (item.organization_access_level == null || (contains(["none", "readonly", "limited", "full"], item.organization_access_level)))])
      )
    ])
    error_message = "must be one of: \"none\", \"readonly\", \"limited\", \"full\""
  }
}

