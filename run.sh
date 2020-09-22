#!/usr/bin/env bash

export ANSIBLE_DEPRECATION_WARNINGS=0
export ANSIBLE_LOG_PATH="ansible.log"
export ANSIBLE_PYTHON_INTERPRETER="/usr/bin/python3"

INV=inventory.ini
if [[ ! -e $INV ]]; then
    echo "127.0.0.1 ansible_connection=local" > $INV
fi
ansible-playbook -i $INV site.yml $@
