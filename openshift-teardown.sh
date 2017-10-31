#!/usr/bin/env bash

if [[ -f "setenv.sh" ]]; then
 source setenv.sh
fi

: ${AWS_ACCESS_KEY_ID?"Need to set AWS_ACCESS_KEY_ID"}
: ${AWS_SECRET_ACCESS_KEY?"Need to set AWS_SECRET_ACCESS_KEY"}

export ANSIBLE_HOST_KEY_CHECKING=False

if [[ ! -f "group_vars/all/vault" ]]; then
 printf "Need to create vault file first"
 return 1
fi

ansible-vault encrypt group_vars/all/vault &>/dev/null
time ansible-playbook -vvv aws-openshift-teardown.yml -i inventory/hosts "$@"
ansible-vault decrypt group_vars/all/vault &>/dev/null
