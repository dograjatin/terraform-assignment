
output "deployment_namespace" {
  value = kubernetes_deployment.deployment.metadata[0].namespace
}

output "deployment_name" {
  value = kubernetes_deployment.deployment.metadata[0].name
}

output "replicas" {
  value = kubernetes_deployment.deployment.spec[0].replicas
}

output "service_name" {
  value = kubernetes_service.service.metadata[0].name
}

output "service_type" {
  value = kubernetes_service.service.spec[0].type
}

output "service_ip" {
  value = kubernetes_service.service.spec[0].cluster_ip
}

output "service_port" {
  value = kubernetes_service.service.spec[0].port[0].port
}