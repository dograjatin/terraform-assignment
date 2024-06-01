output "release_name" {
  value = helm_release.prometheus-grafana.metadata[0].name
}
output "release_namespace" {
  value = helm_release.prometheus-grafana.metadata[0].namespace
}

# output "grafana_admin_password" {
#   value = helm_release.grafana.spec[0].admin_password
  
# }