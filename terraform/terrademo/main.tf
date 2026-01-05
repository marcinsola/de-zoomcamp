terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.14.1"
    }
  }
}

provider "google" {
  credentials = file("creds.json")
  project     = "de-zoomcamp-467414"
  region      = "us-central1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "de-zoomcamp-467414-demo-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}