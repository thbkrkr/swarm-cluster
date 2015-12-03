FROM krkr/dops

COPY . /ops

ENV MACHINE_STORAGE_PATH=/ops/machines/ovh-cloud \
		OS_API_CREDS_PATH=/ops/creds/openrc-creds.sh \
		ANSIBLE_HOST_KEY_CHECKING=False