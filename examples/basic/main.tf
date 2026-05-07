terraform {
  required_version = ">= 1.5.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 5.0"
    }
  }
}

module "dns" {
  source = "github.com/dark-vex/terraform-cloudflare-dns?ref=v1.0.0"

  zone_id = "your-cloudflare-zone-id"

  records = {
    "www" = {
      name    = "www"
      type    = "A"
      content = "203.0.113.10"
      proxied = true
      ttl     = 1
    }
    "mail" = {
      name    = "mail"
      type    = "A"
      content = "203.0.113.20"
      proxied = false
      ttl     = 300
    }
    "mx" = {
      name     = "@"
      type     = "MX"
      content  = "mail.example.com"
      priority = 10
      ttl      = 300
    }
  }
}
