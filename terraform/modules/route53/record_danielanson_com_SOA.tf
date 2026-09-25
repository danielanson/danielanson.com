# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_route53_record" "record_danielanson_com_SOA" {
  health_check_id                  = null
  name                             = "danielanson.com"
  records                          = ["ns-1135.awsdns-13.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = 900
  type                             = "SOA"
  zone_id                          = "Z29E5PUP5TNCHT"
}
