data "google_dns_managed_zone" "harness" {
  name = "harness-demo"
}

resource "google_dns_record_set" "dns" {
  name = "citibanamex.${data.google_dns_managed_zone.harness.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.harness.name

  rrdatas = [var.gke_ingress_ip]
}

resource "google_dns_record_set" "artifactory" {
  name         = "artifactory.citibanamex.${data.google_dns_managed_zone.harness.dns_name}"
  managed_zone = data.google_dns_managed_zone.harness.name
  type         = "CNAME"
  ttl          = 300
  rrdatas      = ["artifactory.citibanamex.${data.google_dns_managed_zone.harness.dns_name}."]
}

resource "google_dns_record_set" "sonarqube" {
  name         = "sonarqube.citibanamex.${data.google_dns_managed_zone.harness.dns_name}"
  managed_zone = data.google_dns_managed_zone.harness.name
  type         = "CNAME"
  ttl          = 300
  rrdatas      = ["sonarqube.citibanamex.${data.google_dns_managed_zone.harness.dns_name}."]
}