terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
     kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }

  required_version = ">= 0.14"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "assignment_namespace" {
  metadata {
    name = "assignment"
  }
}

data "local_file" "app_yaml" {
  filename   = "../kubernetes/app.yaml"
}

resource "kubectl_manifest" "apply_app_yaml" {
  depends_on = [kubernetes_namespace.assignment_namespace]
  yaml_body = data.local_file.app_yaml.content
}