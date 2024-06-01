terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.6.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command = "helm repo add prometheus-community https://prometheus-community.github.io/helm-charts && helm repo update"
    }
  }
}

resource "helm_release" "prometheus-grafana" {
  name             = var.release_name
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            =  var.chart_name
  namespace        =  var.release_namespace
  create_namespace = true
  set{
    name = "grafana.adminPassword"
    value = var.grafana_admin_password
  }
  
}
