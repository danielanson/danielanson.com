# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_route53_record" "record_www_danielanson_com_A" {
  health_check_id                  = null
  name                             = "www.danielanson.com"
  type                             = "A"
  zone_id                          = "Z29E5PUP5TNCHT"
  alias {
    evaluate_target_health = false
    name                   = "s3-website-us-east-1.amazonaws.com"
    zone_id                = "Z3AQBSTGFYJSTF"
  }
}
