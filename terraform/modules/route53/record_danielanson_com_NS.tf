# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_route53_record" "record_danielanson_com_NS" {
  health_check_id                  = null
  name                             = "danielanson.com"
  records                          = ["ns-1135.awsdns-13.org.", "ns-16.awsdns-02.com.", "ns-2014.awsdns-59.co.uk.", "ns-940.awsdns-53.net."]
  ttl                              = 172800
  type                             = "NS"
  zone_id                          = "Z29E5PUP5TNCHT"
}
