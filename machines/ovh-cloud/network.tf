resource "openstack_compute_secgroup_v2" "secgroup_swarm" {
  name = "${var.prefix}-sg-swarm-1"
  description = "22, 80, 2376 from ALL"
  rule {
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  rule {
    from_port = 80
    to_port = 80
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  rule {
    from_port = 8080
    to_port = 8090
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  rule {
    from_port = 2376
    to_port = 2376
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
}

resource "openstack_compute_secgroup_v2" "secgroup_swarm-internal" {
  name = "${var.prefix}-sg-swarm-internal-1"
  description = "All TCP/UDP from internal"
  rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "tcp"
    from_group_id = "${openstack_compute_secgroup_v2.secgroup_swarm.id}"
  }
  rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "udp"
    from_group_id = "${openstack_compute_secgroup_v2.secgroup_swarm.id}"
  }
}

resource "openstack_compute_secgroup_v2" "secgroup_consul" {
  name = "${var.prefix}-sg-consul-1"
  description = "8500"
  rule {
    from_port = 8500
    to_port = 8500
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
}

resource "openstack_compute_keypair_v2" "keypair_swarm" {
  name = "${var.prefix}-keypair-swarm-1"
  public_key = "${file("/ops/ssh/ovh_openstack.pub")}"
}