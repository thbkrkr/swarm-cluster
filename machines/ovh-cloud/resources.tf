provider "openstack" {
}

resource "openstack_compute_instance_v2" "keystore" {
  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  region="${var.region}"
  key_pair="${var.key_pair}"
  security_groups = ["${var.security_groups}"]
}

resource "openstack_compute_instance_v2" "master" {
  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  region="${var.region}"
  key_pair="${var.key_pair}"
  security_groups = ["${var.security_groups}"]
}

resource "openstack_compute_instance_v2" "node" {
  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  region="${var.region}"
  key_pair="${var.key_pair}"
  security_groups = ["${var.security_groups}"]
}

output "keystore-ips" {
  value = "${join(", ", openstack_compute_instance_v2.keystore.*.access_ip_v4)}"
}

output "master-ips" {
  value = "${join(", ", openstack_compute_instance_v2.master.*.access_ip_v4)}"
}

output "node-ips" {
  value = "${join(", ", openstack_compute_instance_v2.node.*.access_ip_v4)}"
}