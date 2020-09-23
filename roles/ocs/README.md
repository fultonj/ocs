ocs
===

Role to install ocs on crc

Requirements
------------

crc should be running (the crc role can do this for you first)

Uses https://docs.ansible.com/ansible/latest/collections/community/kubernetes/k8s_module.html

Variables
---------

Relies on the following which should be the default for the user who
ran the crc role to install crc.

kubeconfig: ~/.crc/machines/crc/kubeconfig

License
-------

BSD

