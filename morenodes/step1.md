Start your Kubernetes cluster by running *launch.sh*:

`launch.sh`{{execute}}

Verify that the single node cluster is ready:

`kubectl cluster-info`{{execute}}

Check to see if the master node is ready:

`kubectl get nodes`{{execute}}

If the node returns NotReady then it is still waiting. Wait a couple of seconds before retrying.
