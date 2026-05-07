# Changelog

## v1.0.0 — 2026-05-07

### Added

- Initial release extracted from [dark-vex/infra-cd](https://github.com/dark-vex/infra-cd)
- `cloudflare_dns_record` resource with `for_each` over a records map
- Support for A, AAAA, CNAME, MX, TXT, SRV, TLSA, and any record type supported by the Cloudflare provider
- `data` block support for complex record types (e.g., TLSA)
- Outputs: `record_ids`, `record_hostnames`
