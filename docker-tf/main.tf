terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "sunk" {
  name         = "nginx:1.19.6"
  keep_locally = true    // keep image after "destroy"
}

resource "docker_container" "once" {
  image = docker_image.sunk.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 2224
  }
}

