resource "kubernetes_service" "deploy_watch" {
  metadata {
    name = "deploy-watch-service"
  }

  spec {
    selector = {
      app = "deploy-watch"
    }

    port {
      port        = 5001
      target_port = 5001
    }

    type = "NodePort"
  }
}
