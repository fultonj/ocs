# Network Policy

OCS provides pods running Ceph daemons which can be seen with:
```
  oc get pods -n openshift-storage -l rook_cluster=openshift-storage
```
We want to expose them to our pyapp which can be seen with:
```
  oc get pods -n pyapp -l deployment=pyapp
```
## Provide access to the ceph-mon

Identify the rook-ceph-mon pod:
```
$ oc get pods -n openshift-storage -l rook_cluster=openshift-storage | grep mon | awk {'print $1'}
rook-ceph-mon-a-5c88cb55b8-pfb28
```
Expose the ceph-mon pod identified in the previous state and name the
resultant service 'ceph-mon'
```
oc expose pod rook-ceph-mon-a-5c88cb55b8-pfb28 -n openshift-storage --name ceph-mon
```
Identify the service IP:
```
$ oc get svc/ceph-mon -n openshift-storage
NAME       TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
ceph-mon   ClusterIP   172.25.20.89   <none>        6789/TCP   5m27s
```
When the pyapp is updated it will be necessary to supply the above IP
and port in the ceph.conf. For exaple:
```
[global]
        mon_host = 172.25.20.89:6789
```
Use [ceph-allow-mon.yml](ceph-allow-mon.yml) to set a NetworkPolicy 
which allows ingress to the rook-ceph-mon pod from the pyapp.
```
$ oc apply -f ceph-allow.yaml 
networkpolicy.networking.k8s.io/ceph-allow-mon created
```
The [pyapp will test it can connect to this port](https://github.com/fultonj/pyapp/commit/ac258a2a8f3faa52e9af3a21dea78ae4b6881e6d)
to access the ceph mon service.

## Expose ceph-osd service

After an exchange with the Ceph Mon an RBD client uses the CRUSH map
to directly interacts with the OSDs. Exposing the OSDs is still a work
in progress.
