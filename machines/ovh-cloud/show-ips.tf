output "keystore-ips" {
  value = "${join(", ", openstack_compute_instance_v2.keystore.*.access_ip_v4)}"
}

output "master-ips" {
  value = "${join(", ", openstack_compute_instance_v2.master.*.access_ip_v4)}"
}

output "node-ips" {
  value = "${join(", ", openstack_compute_instance_v2.node.*.access_ip_v4)}"
}