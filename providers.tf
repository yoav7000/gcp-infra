provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone #TODO: check if zone is needed and mandatory
}
