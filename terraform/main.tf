module "kind_cluster" {
  source        = "./modules/kind_cluster"
  cluster_name  = "satsure-kind-cluster"
  node_image    = "kindest/node:v1.24.0"
  pod_subnet    = "10.20.0.0/16"
  service_subnet = "10.30.0.0/16"
}

module "kubernetes" {
  source            = "./modules/kubernetes"
  kubeconfig_path   = module.kind_cluster.kubeconfig_path
  namespace_name    = "ping-pong"
  deployment_name   = "ping-pong"
  replicas          = 2
  image             = "docker.io/dograjatin/ping-pong:latest"
  cpu_limit         = 0.5
  cpu_request       = 1
  memory_limit      = "256Mi"
  memory_request    = "512Mi"
  health_check_path = "/v1/ping"
  container_port    = 8080
}

module "observability" {
  source          = "./modules/observability"
  kubeconfig_path = module.kind_cluster.kubeconfig_path
  release_name    = "prometheus-grafana"
  chart_name      = "kube-prometheus-stack"
  release_namespace = "observability"
  grafana_admin_password = "password"
}

