# ocs experiments

Plan:

- deploy an ceph cluster with cephadm
- configure ocs to use that ceph cluster in [external mode](https://access.redhat.com/documentation/en-us/red_hat_openshift_container_storage/4.5/html-single/deploying_openshift_container_storage_in_external_mode/index)
- configure ocp client type 1 to use PVs from ocs
- configure ocp client [type 2](https://github.com/fultonj/pyapp) to directly use RBD

If the above works, then it should also be possible to
replace ocp client type 2 with the ones created by
[openstack-k8s-operators](https://github.com/openstack-k8s-operators/dev-tools).

## old

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

