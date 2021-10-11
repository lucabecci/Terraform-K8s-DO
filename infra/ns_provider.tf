provider "kubernetes" {
  config_path = "${local_file.kubeconfig.filename}"
}

resource "kubernetes_namespace" "ns_example" {
  metadata {
    name = "test_ns"
  }
}