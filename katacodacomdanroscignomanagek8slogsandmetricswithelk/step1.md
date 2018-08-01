We already deployed a Kubernetes cluster for you, verify that you have two nodes by running the *kubectl get nodes* command:

`kubectl cluster-info`{{execute}}

`kubectl get nodes`{{execute}}

If the node returns NotReady then it is still waiting. Wait a couple of seconds before retrying.
