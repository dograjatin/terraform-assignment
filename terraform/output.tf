output "cluster_name" {
    value = module.kind_cluster.cluster_name
}

output "cluster_endpoint" {
    value = module.kind_cluster.cluster_endpoint
}

output "cluster_status" {
    value = module.kind_cluster.cluster_status
}

output "kubeconfig_path" {
    value = module.kind_cluster.kubeconfig_path
}

##############################################################################

output "deployment_namespace" {
  value = module.kubernetes.deployment_namespace
}

output "deployment_name" {
  value =module.kubernetes.deployment_name
}

output "replicas" {
  value = module.kubernetes.replicas
}

output "service_name" {
  value = module.kubernetes.service_name
}

output "service_type" {
  value = module.kubernetes.service_type
}

output "service_ip" {
  value = module.kubernetes.service_ip
}

output "service_port" {
  value = module.kubernetes.service_port
}
##############################################################################