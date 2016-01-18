# Put SSH keys here

Generate SSH key:

  ssh-keygen -t rsa -b 4096

Before creating the machine you need import a public SSH key on your [OVH Cloud account](https://horizon.cloud.ovh.net/project/access_and_security/?tab=access_security_tabs__keypairs_tab).

Ansible uses the private key `admin.id_rsa` to SSH the machines.

You can create a soft symbolic link to `admin.id_rsa` with the private key:

	> ls -l
	lrwxrwxrwx 1 root root   13 nov.  11 23:21 admin.id_rsa -> ovh_openstack
	-rw------- 1 thb  thb  3243 nov.   7 10:55 ovh_openstack
	-rw-rw-r-- 1 thb  thb   743 nov.   7 10:55 ovh_openstack.pub
