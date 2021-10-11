resource "kubernetes_service" "server-deployment-service" {
    metadata {
      name = "server-deployment"
    }
    spec {
      selector = {
        "app" = kubernetes_pod.server-pod.metadata.0.labels.app
      }
      session_affinity = "ClientIP"
      port {
        port = 8080
        target_port = 8080
      }

      type = "LoadBalancer"
    }
}