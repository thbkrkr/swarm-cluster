### Put SSH keys here

Generate a SSH key:

  ssh-keygen -t rsa -b 4096

Before creating the machine you need import a public SSH key on your [OVH Cloud account](https://horizon.cloud.ovh.net/project/access_and_security/?tab=access_security_tabs__keypairs_tab).

	> ls -l
	-rw------- 1 thb  thb  3243 nov.   7 10:55 ovh_openstack
	-rw-rw-r-- 1 thb  thb   743 nov.   7 10:55 ovh_openstack.pub
