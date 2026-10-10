output "organization_connections_id" {
  description = "Map of id values across all organization_connections, keyed the same as var.organization_connections except keys with no id are omitted"
  value       = { for k, v in auth0_organization_connections.organization_connections : k => v.id if v.id != null && length(v.id) > 0 }
}
output "organization_connections_enabled_connections" {
  description = "Map of enabled_connections values across all organization_connections, keyed the same as var.organization_connections except keys with no enabled_connections are omitted"
  value       = { for k, v in auth0_organization_connections.organization_connections : k => v.enabled_connections if v.enabled_connections != null && length(v.enabled_connections) > 0 }
}
output "organization_connections_organization_id" {
  description = "Map of organization_id values across all organization_connections, keyed the same as var.organization_connections except keys with no organization_id are omitted"
  value       = { for k, v in auth0_organization_connections.organization_connections : k => v.organization_id if v.organization_id != null && length(v.organization_id) > 0 }
}

