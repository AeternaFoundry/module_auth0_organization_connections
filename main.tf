resource "auth0_organization_connections" "organization_connections" {
  for_each = var.organization_connections

  organization_id = each.value.organization_id

  dynamic "enabled_connections" {
    for_each = each.value.enabled_connections
    content {
      assign_membership_on_login   = enabled_connections.value.assign_membership_on_login
      connection_id                = enabled_connections.value.connection_id
      is_enabled                   = enabled_connections.value.is_enabled
      is_signup_enabled            = enabled_connections.value.is_signup_enabled
      organization_access_level    = enabled_connections.value.organization_access_level
      organization_connection_name = enabled_connections.value.organization_connection_name
      show_as_button               = enabled_connections.value.show_as_button
    }
  }
}

