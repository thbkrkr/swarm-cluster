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
	MACHINE=bim-keystore-1 \
		compote consul up -d

docker-machine-swarm-cluster:
	play install-docker-machine

# Compose

compose-up-stack:
	@echo "[compose] Start an example stack..."
	compote stack up -d

compose-scale-stack:
	@echo "[compose] Scale api stack..."
	compote stack scale demoapi=2
