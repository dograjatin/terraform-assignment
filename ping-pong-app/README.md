Here's a basic README.md template you can use for your Flask app to deploy on a Kubernetes cluster:

---

# Flask Ping-Pong App

This Flask application serves as a simple health check API, responding with a 'pong' message when pinged.

## Prerequisites

- Docker installed on your local machine.
- Kubernetes cluster set up and configured.

## Getting Started

To run the application locally using Docker:

1. Clone this repository:

   ```bash
   git clone <repository-url>
   ```

2. Navigate to the project directory:

   ```bash
   cd <project-directory>/ping-pong-app
   ```

3. Build the Docker image:

   ```bash
   docker build -t flask-ping-pong .
   ```

4. Run the Docker container:

   ```bash
   docker run -p 8080:8080 flask-ping-pong
   ```

The application should now be accessible at `http://localhost:8080/v1/ping`.

## Deploying to Kubernetes

To deploy the application on a Kubernetes cluster:

1. Make sure your Kubernetes cluster is up and running.

2. Apply the Kubernetes deployment configuration:

   ```bash
   kubectl apply -f ping-pong.yaml
   ```

3. Verify that the deployment is running:

   ```bash
   kubectl get pods
   ```

4. Once the pod is running, access the service using its IP address.

## Usage

### Health Check

To perform a health check, send a GET request to `/v1/ping`. You should receive a JSON response with a 'pong' message.

### Error Handling

- If a route other than `/v1/ping` is requested, the application will respond with a JSON object containing an error message and a 404 status code.
- If the application encounters an internal server error, it will respond with a JSON object containing an error message and a 500 status code.

## Contributors

- [Jatin Dogra](https://github.com/dograjatin)

Adjust the placeholders `<repository-url>`, `<repository-directory>`, and any other details as needed. This README assumes that the Terraform configuration handles the deployment of the Ping-Pong application and Helm charts for Prometheus and Grafana automatically.