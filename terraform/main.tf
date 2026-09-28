module "dns" {
  source = "./modules/dns"
  zone_id = "Z29E5PUP5TNCHT"
}

module "storage" {
  source = "./modules/storage"
}

