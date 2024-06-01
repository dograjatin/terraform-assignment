variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
}

variable "release_name" {
  description = "Name of the Helm release"
  default = "prometheus-grafana"
}

variable "chart_name" {
  description = "Name of the Helm chart"
  default = "prometheus-community/kube-prometheus-stack"
}

variable "release_namespace" {
  description = "Name of the Kubernetes namespace"
  default = "observability"
}

variable "grafana_admin_password" {
  description = "Admin password for Grafana"
  type = string
  default = "password"
  sensitive   = true
}