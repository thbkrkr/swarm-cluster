#!/bin/sh -eu
#
# Ansible dynamic inventory.

export SSH_USER=ubuntu
export SSH_PRIVATE_KEY_FILE=/ops/machines/ssh/ovh_openstack

tf-inv.sh "$@"