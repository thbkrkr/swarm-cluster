go:
	@./ops

swarm-up: terraform-play docker-machine-keystores start-keystores docker-machines-all

terraform-apply:
	@echo "[terraform] Create machines..."
	cd ${MACHINE_STORAGE_PATH} && terraform apply

dm: docker-machine-keystores start-keystores docker-machine-all

docker-machine-keystores:
	@echo "[docker-machine] Install Docker..."
	play install-docker-machine -l keystores

start-keystores:
	@echo "[compose] Start keystore..."
	MACHINE=bim-keystore-1 \
		compote consul up -d

docker-machine-all:
	play install-docker-machine

compose-up-stack:
	@echo "[compose] Start an example stack..."
	compote stack up -d

compose-scale-stack:
	@echo "[compose] Scale api stack..."
	compote stack scale demoapi=2
