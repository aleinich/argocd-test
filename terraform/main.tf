terraform {
  required_providers {
    argocd = {
      source  = "oboukili/argocd"
      version = "6.1.1"
    }
  }
}

provider "argocd" {
  server_addr = "localhost:8080" # Assicurati che il port-forward sia attivo
  insecure    = true
  plain_text  = true
  # Se richiesto, aggiungi auth_token o username/password qui
}

module "victoria_metrics_umbrella" {
  source          = "./modules/argocd-app"
  app_name        = "victoria-metrics-ha"
  repo_url        = "https://github.com/aleinich/argocd-test.git"
  target_revision = "HEAD"
  chart_path      = "." 
  namespace       = "victoria-metrics"
}
