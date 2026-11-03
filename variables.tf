variable "zone_id" {
  description = "Cloudflare zone ID"
  type        = string
}

variable "records" {
  description = "Map of DNS records to create"
  type = map(object({
    name     = string
    type     = string
    content  = optional(string)
    proxied  = optional(bool, false)
    priority = optional(number)
    ttl      = optional(number, 1)
    comment  = optional(string)
    data = optional(object({
      # TLSA
      certificate   = optional(string)
      matching_type = optional(number)
      selector      = optional(number)
      usage         = optional(number)
      # CAA
      flags = optional(number)
      tag   = optional(string)
      value = optional(string)
    }))
  }))
}
