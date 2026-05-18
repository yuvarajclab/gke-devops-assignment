# GKE DevOps Assignment

## Project Overview

This project demonstrates an end-to-end cloud-native DevOps workflow using:

* Google Cloud Platform (GCP)
* Terraform
* Docker
* Kubernetes (GKE)
* Artifact Registry
* Node.js

The application was containerized using Docker, infrastructure was provisioned using Terraform, and the application was deployed to a Google Kubernetes Engine (GKE) cluster using Kubernetes manifests.

---

# Architecture

```text
Node.js Application
        ↓
Docker Image
        ↓
Google Artifact Registry
        ↓
Kubernetes Deployment
        ↓
Pods Running in GKE
        ↓
Kubernetes Service (LoadBalancer)
        ↓
Public Internet Access
```

---

# Technologies Used

| Technology        | Purpose                    |
| ----------------- | -------------------------- |
| GCP               | Cloud Provider             |
| Terraform         | Infrastructure as Code     |
| Docker            | Containerization           |
| GKE               | Managed Kubernetes Cluster |
| Kubernetes        | Container Orchestration    |
| Artifact Registry | Docker Image Repository    |
| Node.js           | Sample Application Runtime |

---

# Project Structure

```text
gke-devops-assignment/
├── app/
│   ├── Dockerfile
│   ├── package.json
│   ├── package-lock.json
│   └── server.js
│
├── terraform/
│   ├── main.tf
│   └── provider.tf
│
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
│
└── README.md
```

---

# Application

A simple Node.js application serving:

```text
Hello from Kubernetes DevOps Pipeline!
```

---

# Dockerization

The application was containerized using Docker.

## Build Docker Image

```bash
docker build -t gke-devops-app:v1 .
```

## Run Container Locally

```bash
docker run -d -p 3000:3000 gke-devops-app:v1
```

---

# Infrastructure Provisioning using Terraform

Terraform was used to provision:

* GKE Cluster
* Custom Node Pool
* Kubernetes Worker Node

## Terraform Commands

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Preview Infrastructure

```bash
terraform plan
```

### Provision Infrastructure

```bash
terraform apply
```

---

# Artifact Registry

Docker images were pushed to Google Artifact Registry.

## Configure Docker Authentication

```bash
gcloud auth configure-docker asia-south1-docker.pkg.dev
```

## Tag Image

```bash
docker tag gke-devops-app:v1 \
asia-south1-docker.pkg.dev/PROJECT_ID/devops-repo/gke-devops-app:v1
```

## Push Image

```bash
docker push asia-south1-docker.pkg.dev/PROJECT_ID/devops-repo/gke-devops-app:v1
```

---

# Kubernetes Deployment

Kubernetes manifests were used to deploy the application.

## Deployment

* 2 replicas
* Container image from Artifact Registry
* Exposed container port 3000

## Service

* Type: LoadBalancer
* Public external IP exposed through GCP Load Balancer

---

# Kubernetes Commands

## Apply Deployment

```bash
kubectl apply -f deployment.yaml
```

## Apply Service

```bash
kubectl apply -f service.yaml
```

## Verify Pods

```bash
kubectl get pods
```

## Verify Services

```bash
kubectl get svc
```

---

# Successful Deployment Verification

The application was successfully accessed using the external LoadBalancer IP.

Example:

```text
http://34.100.166.176
```

Response:

```text
Hello from Kubernetes DevOps Pipeline!
```

---

# Challenges Faced and Troubleshooting

During implementation, several real-world cloud infrastructure issues were encountered and resolved:

## Issues Resolved

* GCP billing configuration issues
* Incorrect project ID usage
* GKE quota limitations
* SSD quota exceeded errors
* Terraform deletion protection conflicts
* Kubernetes node pool provisioning issues
* Artifact Registry IAM permission issues
* Kubernetes ImagePullBackOff troubleshooting

## Key Learnings

* Infrastructure provisioning using Terraform
* Kubernetes cluster management using GKE
* Kubernetes Deployment and Service concepts
* Docker image lifecycle and registry integration
* GCP IAM and Artifact Registry permissions
* Kubernetes troubleshooting and operational debugging

---

# Cleanup

To avoid unnecessary cloud charges:

```bash
terraform destroy
```

---

# Outcome

This project demonstrates:

* Infrastructure as Code (IaC)
* Containerization
* Kubernetes deployment
* Cloud-native application delivery
* DevOps troubleshooting and debugging
* End-to-end deployment automation on GCP
