terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "node_image" {
  name = "node:16-alpine"
}

resource "docker_container" "node_app" {
  name  = "my-node-app"
  image = docker_image.node_image.image_id  # Use image_id instead of latest
  ports {
    internal = 5000
    external = 5000
  }
 command = ["sh", "-c", "while true; do sleep 1000; done"]
}

