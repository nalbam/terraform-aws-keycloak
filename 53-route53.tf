# route53

data "aws_route53_zone" "this" {
  count = var.dns_root != "" ? 1 : 0

  name = var.dns_root
}

resource "aws_route53_record" "this" {
  count = var.dns_root != "" ? 1 : 0

  zone_id = data.aws_route53_zone.this[0].zone_id
  name    = local.domain_name
  type    = "CNAME"
  ttl     = 300

  records = [
    # aws_eip.this.public_ip,
    aws_alb.this.dns_name,
    # aws_elb.this.dns_name,
  ]
}
