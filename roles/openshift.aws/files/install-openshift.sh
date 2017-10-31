#!/usr/bin/env bash
export ANSIBLE_HOST_KEY_CHECKING=False

if [ $1 = "origin" ]; then
    # Origin
    ansible-playbook -i ~{{ remote_user_name }}/openshift_inventory.cfg ~{{ remote_user_name }}/openshift-ansible/playbooks/byo/config.yml
else
    # Enterprise
    ansible-playbook -i ~{{ remote_user_name }}/openshift_inventory.cfg /usr/share/ansible/openshift-ansible/playbooks/byo/config.yml
fi
