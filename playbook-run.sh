#!/bin/sh

# ignore this prompt
# This key is not known by any other names.
# Are you sure you want to continue connecting (yes/no/[fingerprint])?
export ANSIBLE_HOST_KEY_CHECKING=False

export ANSIBLE_SSH_COMMON_ARGS="-F ssh_config"
# export ANSIBLE_SSH_ARGS="-F ssh_config"

# export ANSIBLE_STDOUT_CALLBACK=unixy

ansible-playbook -i ansible/inventory.ini ansible/playbook.yaml
# --ssh-common-args="-F ssh_config" 
