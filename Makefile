NAME = $$(basename $$(pwd))

swarm-up:
	make -C machines tf-apply
	make -C ansible upgrade-kernel
	make -C ansible install-keystore-machine
	make -C compose run-keystore
	make -C ansible install-docker-machine
	make -C compose run-stack

#########

go:
	docker run --rm -ti \
		--name $(NAME) \
		-v $$(pwd):/ops \
		-e MACHINE_STORAGE_PATH=/ops/machines/ovh-cloud \
		-e OS_API_CREDS_PATH=/ops/creds/openrc-creds.sh \
		-e ANSIBLE_HOST_KEY_CHECKING=False \
		krkr/dops:ovh

exec:
	docker exec -ti $(NAME) zsh
