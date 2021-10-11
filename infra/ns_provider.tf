provider "kubernetes" {
  config_path = "${local_file.kubernetes_config.filename}"
}

resource "kubernetes_namespace" "ns-example" {
  metadata {
    name = "test-ns"
  }
}