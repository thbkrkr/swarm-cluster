ENV = bim

go:
	@./ops

swarm-up: terraform docker-machine-all

# Swarm cluster creation

docker-machine-all: keystores docker-machine-swarm-cluster

keystores: docker-machine-keystores start-keystores

terraform-apply:
	@echo "[terraform] Create machines..."
	cd ${MACHINE_STORAGE_PATH} && terraform apply

docker-machine-keystores:
	@echo "[docker-machine] Install Docker..."
	play install-docker-machine -l keystores

start-keystores:
	@echo "[compose] Start keystore..."
	MACHINE=$(ENV)-keystore-1 \
		compoze consul up -d

docker-machine-swarm-cluster:
	play install-docker-machine

# Compose

compose-up-stack:
	@echo "[compose] Start an example stack..."
	compoze stack up -d

compose-scale-stack:
	@echo "[compose] Scale api stack..."
	compoze stack scale demoapi=2

# dev

build:
	@./ops build

dev:
	docker run --rm -ti \
		--name $NAME \
		-v $$(pwd):/ops \
		-v $$(pwd)/bin:/root/bin \
		-v $$(pwd)/ansible/ansible.cfg:/etc/ansible/ansible.cfg \
		--env-file=$$(pwd)/machines/creds/$(ENV)-os-creds.env \
		-e MACHINE_STORAGE_PATH=/ops/machines/$(ENV) \
		-e ENV=$(ENV) \
		-e TF_VAR_prefix=$(ENV) \
		-p 80:4242 \
		krkr/dops go-apish -apiDir=/ops/api
