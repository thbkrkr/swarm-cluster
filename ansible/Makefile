ENV 			= $(shell basename ${MACHINE_STORAGE_PATH})
INVENTORY = inventory/$(ENV)

prepare: install-keystore-machine run-keystore install-docker-machine

## Playbooks

install-keystore-machine:
	ansible-playbook -i $(INVENTORY) playbooks/install-docker-machine.yml -l keystores

run-keystore:
	make -C ../compose run-keystore

install-docker-machine:
	ansible-playbook -i $(INVENTORY) playbooks/install-docker-machine.yml

upgrade-kernel:
	ansible-playbook -i $(INVENTORY) playbooks/upgrade-kernel.yml

## Commands

exec-%:
	ansible all -i $(INVENTORY) -m command -a "$*"

uname-a:
	ansible all -i $(INVENTORY) -m command -a "uname -a"