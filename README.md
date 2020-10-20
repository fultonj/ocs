# OCSi experiments (internal ceph)

Scripts to configure OCS with it's own Internal Ceph cluster
(in constrast to [OCSe](https://github.com/fultonj/ocse)).

To install OCS on CRC use [run.sh](run.sh) to do the following with
Ansible roles:

1. install code ready containers with [roles/crc](roles/crc)
2. install ocs with [roles/ocs](roles/ocs)
3. create pools and cephx key on ocs with [roles/openstack_pools](roles/openstack_pools)

Place the files `ceph.client.openstack.keyring` and `ceph.conf`,
created from the last step above, in a cloned copy of
[this app](https://github.com/fultonj/pyapp) and follow the directions
to deploy the app in its own project (if you create the app from
github, then you'll need to update it to include your cephx key and
conf file). You can follow the steps in [policy](policy) so the pyapp
can access the mon service within OCS (but not the OSDs).

