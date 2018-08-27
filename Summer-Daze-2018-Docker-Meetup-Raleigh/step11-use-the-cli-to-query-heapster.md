You just scaled the frontend deployment, now pull the most recent two minutes of logs for the deployment:

`kubectl logs deployment/frontend --since=2m`{{execute HOST1}}

and the related events:

`kubectl get events -n default|grep frontend`{{execute HOST1}}

Look at the CPU and memory use of the pods in the default namespace:

`kubectl top pods`{{execute HOST1}}

Look at the CPU and memory use of the Nodes:

`kubectl top nodes`{{execute HOST1}}
