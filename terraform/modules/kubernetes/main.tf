terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.30.0"
    }
  }
}


provider "kubernetes" {
  config_path = var.kubeconfig_path
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace_name
  }
}

resource "kubernetes_deployment" "deployment" {
  metadata {
    name = var.deployment_name
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.deployment_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.deployment_name
        }
      }
      spec {
        container {
          image = var.image
          name  = var.deployment_name
          image_pull_policy = "IfNotPresent"
          port {
            container_port = var.container_port
          }
          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "0.25"
              memory = "256Mi"
            }
          }
          liveness_probe {
            http_get {
              path = var.health_check_path
              port = var.container_port
            }
            failure_threshold = 3
            success_threshold = 1
            timeout_seconds = 5
          }

          readiness_probe {
            http_get {
              path = var.health_check_path
              port = var.container_port
            }
            failure_threshold = 3
            success_threshold = 1
            timeout_seconds = 5
          }
        }
      }
    }
  }
  depends_on = [kubernetes_namespace.namespace]
}

resource "kubernetes_service" "service" {
  metadata {
    name = "${var.deployment_name}-service"
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }

  spec {
    selector = {
      app = var.deployment_name
    }
    type = "ClusterIP"
    port {
      port = var.container_port
    }
  }
  depends_on = [kubernetes_namespace.namespace]
}

resource "kubernetes_ingress_class_v1" "ingress_class" {
  metadata {
    name = "nginx"
  }
  spec {
    controller = "k8s.io/nginx-ingress-controller"
  }
  depends_on = [kubernetes_namespace.namespace]
}

resource "kubernetes_ingress_v1" "ingress" {
  metadata {
    name = "${var.deployment_name }-ingress"
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }
  spec {
    ingress_class_name = kubernetes_ingress_class_v1.ingress_class.metadata.0.name
    rule {
      http {
        path {
          backend {
            service {
              name = kubernetes_service.service.metadata.0.name
              port {
                number = var.container_port
              }
            }
          }
          path = "/"
        }
      }
    }
  }
  depends_on = [kubernetes_namespace.namespace]
}
