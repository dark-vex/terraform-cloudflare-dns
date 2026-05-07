# terraform-cloudflare-dns

Terraform module for managing Cloudflare DNS records using the [cloudflare/cloudflare](https://registry.terraform.io/providers/cloudflare/cloudflare) provider.

Manages a set of DNS records for a single zone via `for_each`, supporting all record types including complex types that require a `data` block (e.g., TLSA).

## Usage

```hcl
module "dns_example_com" {
  source = "github.com/dark-vex/terraform-cloudflare-dns?ref=v1.0.0"

  zone_id = "your-cloudflare-zone-id"

  records = {
    "www" = {
      name    = "www"
      type    = "A"
      content = "203.0.113.10"
      proxied = true
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
```

See [`examples/basic/`](examples/basic/) for a full working example.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 5.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [cloudflare_dns_record.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_records"></a> [records](#input\_records) | Map of DNS records to create | <pre>map(object({<br/>    name     = string<br/>    type     = string<br/>    content  = optional(string)<br/>    proxied  = optional(bool, false)<br/>    priority = optional(number)<br/>    ttl      = optional(number, 1)<br/>    comment  = optional(string)<br/>    data = optional(object({<br/>      certificate   = string<br/>      matching_type = number<br/>      selector      = number<br/>      usage         = number<br/>    }))<br/>  }))</pre> | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | Cloudflare zone ID | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_record_hostnames"></a> [record\_hostnames](#output\_record\_hostnames) | Map of record keys to their hostnames |
| <a name="output_record_ids"></a> [record\_ids](#output\_record\_ids) | Map of record keys to their Cloudflare record IDs |
<!-- END_TF_DOCS -->

## License

[MIT](LICENSE)
