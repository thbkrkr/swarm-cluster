
resource "openstack_compute_instance_v2" "keystore" {
  name = "${var.prefix}-keystore-${count.index + 1}"
  count = "${var.nb_keystores}"
  metadata {
    group = "keystores"
  }

  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  region="${var.region}"
  key_pair="${openstack_compute_keypair_v2.keypair_swarm.name}"
  security_groups = [
    "${openstack_compute_secgroup_v2.secgroup_swarm.name}",
    "${openstack_compute_secgroup_v2.secgroup_swarm-internal.name}",
    "${openstack_compute_secgroup_v2.secgroup_consul.name}"
  ]
}



resource "openstack_compute_instance_v2" "master" {
  image_name = "${var.image}"
  name = "${var.prefix}-master-${count.index + 1}"
  count = "${var.nb_masters}"
  metadata {
    group = "masters"
  }

  flavor_name = "${var.flavor}"
  region="${var.region}"
  key_pair="${openstack_compute_keypair_v2.keypair_swarm.name}"
  security_groups = [
    "${openstack_compute_secgroup_v2.secgroup_swarm.name}",
    "${openstack_compute_secgroup_v2.secgroup_swarm-internal.name}"
  ]
}

resource "openstack_compute_instance_v2" "node" {
  name = "${var.prefix}-node-${count.index + 1}"
  count = "${var.nb_nodes}"
  metadata {
    group = "nodes"
  }

  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  region="${var.region}"
  key_pair="${openstack_compute_keypair_v2.keypair_swarm.name}"
  security_groups = [
    "${openstack_compute_secgroup_v2.secgroup_swarm.name}",
    "${openstack_compute_secgroup_v2.secgroup_swarm-internal.name}"
  ]
}
