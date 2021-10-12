resource "kubernetes_pod" "server2-pod" {
  metadata {
    name = "server2"
    labels = {
        "app" = "server2"
    }
  }

  spec {
    container {
        image = "lucabecci/express_svc"
      name = "server"
      env {
        name = "PORT"
        value = 4040
      }
      env {
        name = "NODE_ENV"
        value = "prod"
      }
      env {
        name = "NAMESPACE"
        value = "Server2_SVC"
      }
      port {
        container_port = 4040
      }

      liveness_probe {
        http_get {
          path = "/"
          port = 4040
        }
        initial_delay_seconds = 3
        period_seconds = 3
      }
    }
  }
}