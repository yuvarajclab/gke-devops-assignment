resource "google_container_cluster" "primary" {
  name     = "devops-gke-cluster"
  location = "asia-south1-a"

deletion_protection = false

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "devops-node-pool"
  location   = "asia-south1-a"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
  machine_type = "e2-small"
  disk_size_gb = 30
  disk_type    = "pd-standard"

  oauth_scopes = [
    "https://www.googleapis.com/auth/cloud-platform"
  ]
 }
}
