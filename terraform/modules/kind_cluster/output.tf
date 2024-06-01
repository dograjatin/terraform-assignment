output "cluster_name" {
  value = kind_cluster.default.name
}

output "cluster_endpoint" {
  value = kind_cluster.default.endpoint
  
}

output "kubeconfig_path" {  
  value = kind_cluster.default.kubeconfig_path
}

output "cluster_status" {
  value = kind_cluster.default.completed
}
