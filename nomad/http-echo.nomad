job "http-echo-Hashi-032618-sparrow" {
  datacenters = ["dc1"]

  group "echo" {
    task "server" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo:0.2.3"
        args  = [
          "-listen", ":80",
          "-text", "hello world",
        ]
      }

      resources {
        network {
          mbits = 10
          port "http" {
            static = 80
          }
        }
      }

      service {
        name = "http-echo"
        port = "http"

        tags = [
          "Hashi-032618-sparrow",
          "urlprefix-/http-echo",
        ]

        check {
          type     = "http"
          path     = "/health"
          interval = "2s"
          timeout  = "2s"
        }
      }
    }
  }
}
