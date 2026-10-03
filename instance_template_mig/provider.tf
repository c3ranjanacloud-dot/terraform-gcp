terraform {
    required_providers {
        google = {
    source = "hashicorp/google"
    }
    }
}
   
# Terraform Provider Block
provider "google" {
  project = "project-3132e387-50db-4ac6-9f1"
  region = "us-central1"
}