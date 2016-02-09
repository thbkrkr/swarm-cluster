FROM krkr/dops

ARG ENV

COPY . /ops
COPY bin /root/bin
COPY ansible/ansible.cfg /etc/ansible/ansible.cfg

ENV ENV=$ENV \
    MACHINE_STORAGE_PATH=/ops/machines/$ENV \
		ANSIBLE_HOST_KEY_CHECKING=False

RUN cd /ops/machines/$ENV && terraform get -update && \
    source /ops/machines/creds/$ENV-os-creds.sh