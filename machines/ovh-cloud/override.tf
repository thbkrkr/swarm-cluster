resource "openstack_compute_instance_v2" "keystore" {
  name = "${var.prefix}-keystore-${count.index + 1}"
  count = 1
  metadata {
    group = "keystores"
  }
}

resource "openstack_compute_instance_v2" "master" {
  name = "${var.prefix}-master-${count.index + 1}"
  count = 1
  metadata {
    group = "masters"
  }
}

resource "openstack_compute_instance_v2" "node" {
  name = "${var.prefix}-node-${count.index + 1}"
  count = 8
  metadata {
    group = "nodes"
  }
}
