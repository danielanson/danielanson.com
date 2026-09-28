resource "aws_route53_record" "record_danielanson_com_A" {
  health_check_id                  = null
  name                             = var.base_website_name
  type                             = "A"
  zone_id                          = var.zone_id
  alias {
    evaluate_target_health = false
    name                   = "s3-website-us-east-1.amazonaws.com"
    zone_id                = "Z3AQBSTGFYJSTF"
  }
}

resource "aws_route53_record" "record_danielanson_com_NS" {
  health_check_id                  = null
  name                             = var.base_website_name
  records                          = ["ns-1135.awsdns-13.org.", "ns-16.awsdns-02.com.", "ns-2014.awsdns-59.co.uk.", "ns-940.awsdns-53.net."]
  ttl                              = 172800
  type                             = "NS"
  zone_id                          = var.zone_id
}

resource "aws_route53_record" "record_danielanson_com_SOA" {
  health_check_id                  = null
  name                             = var.base_website_name
  records                          = ["ns-1135.awsdns-13.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = 900
  type                             = "SOA"
  zone_id                          = var.zone_id
}

resource "aws_route53_record" "record_www_danielanson_com_A" {
  health_check_id                  = null
  name                             = "www.${var.base_website_name}"
  type                             = "A"
  zone_id                          = var.zone_id
  alias {
    evaluate_target_health = false
    name                   = "s3-website-us-east-1.amazonaws.com"
    zone_id                = "Z3AQBSTGFYJSTF"
  }
}

resource "aws_route53_zone" "zone_danielanson_com" {
  comment                     = "Managed by Terraform"
  delegation_set_id           = null
  force_destroy               = null
  name                        = var.base_website_name
  tags                        = {}
  tags_all                    = {}
}
