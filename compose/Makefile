PREFIX      = bim
MASTER      = $(PREFIX)-master-1
KEYSTORE    = $(PREFIX)-keystore-1
KEYSTORE_IP = $(shell docker-machine ip $(KEYSTORE))

run-keystore:
	./compose.sh $(KEYSTORE) keystore

run-%:
	KEYSTORE_IP=$(KEYSTORE_IP) COUNT=$* NODE=$(PREFIX)-node-$* \
		NODE_IP=$(shell docker-machine ip $(PREFIX)-node-$*) \
		./compose.sh swarm stack

scale-%:
	docker-compose -f stack.yml scale api=$*