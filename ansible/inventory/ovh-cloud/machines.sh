#!/bin/sh -eu
#
# Ansible dynamic inventory.

export SSH_USER=ubuntu
tf-inv.sh "$@"