terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "project-bc7a0df3-c037-4d41-86a"
  region  = "asia-south1"
}
