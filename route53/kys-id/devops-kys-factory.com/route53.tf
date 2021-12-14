# AWS Route53 Zone
resource "aws_route53_zone" "devopskysfactory_com" {
  name    = "devops-kys-factory.com"
  comment = "HostedZone created by Route53 Registrar - Manged Terraform"
}

resource "aws_route53_record" "ns_prod_devops-kys-factory_com" {
  zone_id = aws_route53_zone.devopskysfactory_com.zone_id
  name    = "prod"
  type    = "NS"
  ttl     = "300"
  records = [
    # Refer to Route53 Zone for `prod.devops-kys-factory.com in `kys-id`
    "ns-1626.awsdns-11.co.uk.",
    "ns-1184.awsdns-20.org.",
    "ns-378.awsdns-47.com.",
    "ns-619.awsdns-13.net."
  ]
}
