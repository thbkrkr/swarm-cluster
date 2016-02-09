module "terraform-swarm" {
  source = "github.com/thbkrkr/terraform/swarm"
  #source = "./swarm"

  prefix = "bim"

  nb_keystores = 1
  nb_masters  = 1
  nb_nodes  = 1

  image = "Ubuntu 15.10"
  flavor = "eg-7"
  region = "BHS1"

  admin_cidr = "0.0.0.0/0"
  ssh_public_key = "${file("/ops/creds/ssh/ovh_openstack.pub")}"
}