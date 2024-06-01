terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.5.1"
    }
  }
}

resource "kind_cluster" "default" {
  name           = var.cluster_name
  wait_for_ready = true
  node_image     = var.node_image
  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
    networking {
      pod_subnet     = var.pod_subnet
      service_subnet = var.service_subnet
    }
  }
}
