variable "cluster_name" {
  description = "Name of the Kind cluster"
}

variable "node_image" {
  description = "Node image for the Kind cluster"  
}

variable "pod_subnet" {
  description = "Pod subnet for the Kind cluster"
}

variable "service_subnet" {
  description = "Service subnet for the Kind cluster"
}
