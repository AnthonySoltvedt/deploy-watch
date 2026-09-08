resource "kubernetes_deployment" "deploy_watch" {
  metadata {
    name = "deploy-watch"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "deploy-watch"
      }
    }

    template {
      metadata {
        labels = {
          app = "deploy-watch"
        }
      }

      spec {
        container {
          name              = "deploy-watch"
          image             = "deploy-watch:latest"
          image_pull_policy = "Never"

          port {
            container_port = 5001
          }

          liveness_probe {
            http_get {
              path = "/health"
              port = 5001
            }
            initial_delay_seconds = 5
            period_seconds        = 10
          }
        }
      }
    }
  }
}
