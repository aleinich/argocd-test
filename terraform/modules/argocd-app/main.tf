  metadata {
    name      = var.app_name
    namespace = "argocd"
  }

  spec {
    project = "default"

    source {
      repo_url        = var.repo_url
      target_revision = var.target_revision
      path            = var.chart_path # Punto dove si trova il Chart.yaml (root ".")

      helm {
        # Carica il values.yaml che definisce node1, node2 e vmauth
        value_files = ["values.yaml"]
      }
    }

    destination {
      server    = "https://kubernetes.default.svc"
      namespace = var.namespace
    }

    sync_policy {
      automated {
        prune     = true
        self_heal = true
      }
      sync_options = ["CreateNamespace=true"]
    }
  }
}
