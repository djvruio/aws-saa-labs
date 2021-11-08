terraform {
  required_providers {
      docker = {
          source = "kreuzwerker/docker"
          version = ">= 2.13.0"
      }
  }
}

#configure the docker provider
provider "docker" {
    host = "npipe:////.//pipe//docker_engine"
  
}

# pulls the image
resource "docker_image" "nginx" {
    name         = "nginx:latest"
    keep_locally = false
}

# create a container
resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}