# ocs experiments

Use [run.sh](run.sh) to do the following with Ansible roles:

1. install code ready containers with [roles/crc](roles/crc)
2. install ocs with [roles/ocs](roles/ocs)
3. create pools and cephx key on ocs with [roles/openstack_pools](roles/openstack_pools)

Then place the files `ceph.client.openstack.keyring` and
`ceph.conf`, created from the last step above, in a cloned copy of
[this app](https://github.com/fultonj/pyapp) and follow the directions
to deploy the app in its own project.

Commands to configure the `openshift-storage` project deployed in step
2 above so that the [pyapp project](https://github.com/fultonj/pyapp)
can access it need to be posted here.

This should prove that you can deploy OCS and allow direct access to
its Ceph pools via RBD to another project. It should then be possible
to import the same cephx key and ceph.conf into the
[openstack-k8s-operators](https://github.com/openstack-k8s-operators/dev-tools)
so that they can use OCS as a backend.
