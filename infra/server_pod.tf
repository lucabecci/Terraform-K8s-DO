resource "kubernetes_pod" "server-pod" {
  metadata {
    name = "server"
    labels = {
      "app" = "server"
    }
  }
  spec {
    container  {
      image = "lucabecci/express_svc"
      name = "server"
      env {
        name = "PORT"
        value = 8080
      }
      env {
        name = "NODE_ENV"
        value = "prod"
      }
      env {
        name = "NAMESPACE"
        value = "Server_SVC"
      }
      port {
        container_port = 8080
      }

      liveness_probe {
        http_get {
          path = "/"
          port = 8080
        }
        initial_delay_seconds = 3
        period_seconds = 3
      }
    }
  }
}