crc
===

Role to install Code Ready Containers and create an RC file to access them

Automates what is found in these docs for my own environment:
https://access.redhat.com/documentation/en-us/red_hat_codeready_containers

Assumes there is a directory called "artifacts" where role is run
containing the pull-secret and tarball (e.g. crc-linux-amd64.tar.xz)
from https://cloud.redhat.com/openshift/install/crc/installer-provisioned

Creates "shiftrc" in directory where role is run which can be sourced
to access the CRC environment this role sets up. RC file sets up bash
alias with `ocadm` to login as kubeadmin and alias `ocdev` to login as
developer.

Change default variables in defaults/main.yml 


License
-------

Apache
