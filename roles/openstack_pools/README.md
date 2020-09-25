openstack_pools
===============

Creates three RBD pools for use by openastck Nova, Glance and Cinder
and a cephx key to use access them. Writes the cephx key to
`target_output` which defaults to `ceph.client.openstack.keyring`.

Basically connects to the Ceph server and runs these commands:
```
for POOL in vms volumes images; do ceph osd pool create $POOL 16; done

ceph auth add client.openstack mon 'allow r' osd 'allow class-read object_prefix rbd_children, allow rwx pool=vms, allow rwx pool=volumes, allow rwx pool=images'

ceph auth get client.openstack > ceph.client.openstack.keyring
```

