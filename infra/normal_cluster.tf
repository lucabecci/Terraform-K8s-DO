resource "digitalocean_kubernetes_cluster" "test" {
  name = "test"
  region = "nyc1"
  version = "1.21.3-do.0"

  node_pool {
    name = "test-nodes"
    size = "s-1vcpu-2gb"
    node_count = 1
  }
}