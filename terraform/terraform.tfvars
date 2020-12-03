project = "mis484-6-287502"
credentials_file = "mis484-6.json"
cidrs = [ "10.0.0.0/16", "10.1.0.0/16" ]
region = "us-central1"
machine_types = {
  dev  = "f1-micro"
  test = "n1-highcpu-32"
  prod = "n1-highcpu-32"
  db   = "f1-micro"
}
