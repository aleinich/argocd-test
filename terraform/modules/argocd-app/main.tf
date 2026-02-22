required_providers {
    argocd = {
      source  = "oboukili/argocd"
      version = "6.1.1"
    }
  }
}

resource "argocd_application" "victoria_metrics" {
  metadata {
    name      = var.app_name
    namespace = "argocd" # Namespace dove è installato ArgoCD
  }

  spec {
    project = "default"

    source {
      repo_url        = var.repo_url
      target_revision = var.target_revision
      path            = var.chart_path

      helm {
        # Carica il file values.yaml presente nel repository git
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
