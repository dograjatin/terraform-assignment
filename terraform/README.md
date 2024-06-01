Got it, here's the updated README.md:

---

# Terraform Infrastructure Setup for Kubernetes Cluster and Monitoring

This Terraform configuration automates the provisioning of a Kubernetes cluster using KinD (Kubernetes in Docker), deploys a Flask Ping-Pong application onto the cluster, and sets up Prometheus and Grafana for monitoring the cluster and application metrics.

## Prerequisites

- Terraform installed on your local machine.
- Docker installed on your local machine.
- `kubectl` configured to interact with the Kubernetes cluster.

## Getting Started

1. Clone this repository:

   ```bash
   git clone <repository-url>
   ```

2. Navigate to the Terraform directory:

   ```bash
   cd <repository-directory>/terraform
   ```

3. Initialize Terraform:

   ```bash
   terraform init
   ```

4. Apply the Terraform configuration to provision the Kubernetes cluster and deploy the application:

   ```bash
   terraform apply
   ```

   Terraform will automatically provision the Kubernetes cluster using KinD, deploy the Ping-Pong application, and set up Prometheus and Grafana for monitoring.

## Monitoring the Cluster and Application

- Access Grafana dashboard:

  ```bash
  kubectl port-forward service/grafana 3000:80
  ```

  Open your browser and go to `http://localhost:3000` to access Grafana. Log in with the default credentials (username: admin, password: admin).

- Configure Prometheus as a data source in Grafana.

- Import predefined dashboards for Kubernetes and application monitoring.

## Clean Up

To tear down the infrastructure provisioned by Terraform:

1. Navigate to the Terraform directory:

   ```bash
   cd ../terraform
   ```

2. Destroy the resources:

   ```bash
   terraform destroy
   ```

## Contributors

- [Jatin Dogra](https://github.com/dograjatin)

Adjust the placeholders `<repository-url>`, `<repository-directory>`, and any other details as needed. This README assumes that the Terraform configuration handles the deployment of the Ping-Pong application and Helm charts for Prometheus and Grafana automatically.