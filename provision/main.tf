data "google_dns_managed_zone" "harness" {
  name = "harness-demo"
}

resource "google_dns_record_set" "dns" {
  name = "selatam.${data.google_dns_managed_zone.harness.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.harness.name

  rrdatas = [var.gke_ingress_ip]
}

resource "google_dns_record_set" "artifactory" {
  name         = "artifactory.selatam.${data.google_dns_managed_zone.harness.dns_name}"
  managed_zone = data.google_dns_managed_zone.harness.name
  type         = "CNAME"
  ttl          = 300
  rrdatas      = ["selatam.${data.google_dns_managed_zone.harness.dns_name}"]
}

resource "google_dns_record_set" "sonarqube" {
  name         = "sonarqube.selatam.${data.google_dns_managed_zone.harness.dns_name}"
  managed_zone = data.google_dns_managed_zone.harness.name
  type         = "CNAME"
  ttl          = 300
  rrdatas      = ["selatam.${data.google_dns_managed_zone.harness.dns_name}"]
}

resource "google_dns_record_set" "prometheus" {
  name         = "prometheus.selatam.${data.google_dns_managed_zone.harness.dns_name}"
  managed_zone = data.google_dns_managed_zone.harness.name
  type         = "CNAME"
  ttl          = 300
  rrdatas      = ["selatam.${data.google_dns_managed_zone.harness.dns_name}"]
}

resource "google_dns_record_set" "prometheus" {
  name         = "grafana.selatam.${data.google_dns_managed_zone.harness.dns_name}"
  managed_zone = data.google_dns_managed_zone.harness.name
  type         = "CNAME"
  ttl          = 300
  rrdatas      = ["selatam.${data.google_dns_managed_zone.harness.dns_name}"]
}
