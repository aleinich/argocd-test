provider "argocd" {
  server_addr = "localhost:8080" # Dopo aver fatto: kubectl port-forward svc/argocd-server -n argocd 8080:443
  insecure    = true
  plain_text  = true
}

module "victoria_metrics_umbrella" {
  source          = "./modules/argocd-app"
  app_name        = "victoria-metrics-ha"
  repo_url        = "https://github.com/aleinich/argocd-test.git"
  target_revision = "HEAD"
  chart_path      = "." # Il Chart.yaml è nella root del repo
  namespace       = "victoria-metrics"
}
