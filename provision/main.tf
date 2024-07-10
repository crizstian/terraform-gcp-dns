data "google_dns_managed_zone" "harness" {
  name = "harness-demo"
}

resource "google_dns_record_set" "dns" {
  name = "*.selatam.${data.google_dns_managed_zone.harness.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.harness.name

  rrdatas = [var.gke_ingress_ip]
}

