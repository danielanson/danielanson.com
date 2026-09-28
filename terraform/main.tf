module "dns" {
  source = "./modules/dns"
  zone_id = "Z29E5PUP5TNCHT"
  base_website_name = "danielanson.com"
}

module "storage" {
  source = "./modules/storage"
}