variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
}

variable "namespace_name" {
  description = "Name of the Kubernetes namespace"
}

variable "deployment_name" {
  description = "Name of the Kubernetes deployment"
}

variable "replicas" {
  description = "Number of replicas for the deployment"
  default = 2
  
}

variable "image" {
  description = "Container image for the deployment"
}

variable "cpu_limit" {
  description = "CPU limit for the container"
  default = 0.5
  
}

variable "cpu_request" {
  description = "CPU request for the container"
  default = 0.25    
  
}

variable "memory_limit" {
  description = "Memory limit for the container"
  default = "512Mi"
}

variable "memory_request" {
  description = "Memory request for the container"
  default = "256Mi"
}

variable "health_check_path" {
  description = "Path to the endpoint for the health check path"
}

variable "container_port" {
  description = "Container port to expose"
}

