
Event is one of the metric sets in the Metricbeat Kubernetes module, and it lets us know when things happen.  In this case we will look for notifications related to scaling k8s deployments up or down.

#### Scale your deployments and see new pods being monitored

List the existing deployments:
`kubectl get deployments`{{execute HOST1}}

Scale the frontend up to two pods:
`kubectl scale --replicas=2 deployment/frontend`{{execute HOST1}}

Check the frontend deployment:
`kubectl get deployment frontend`{{execute HOST1}}

#### View the changes in Kibana
See the screenshot, add the indicated filters and then add the columns to the view.  You can see the ScalingReplicaSet entry that is marked, following from there to the top of the list of events shows the image being pulled, the volumes mounted, the pod starting, etc.
![Kibana Discover](https://raw.githubusercontent.com/elastic/examples/master/MonitoringKubernetes/scaling-discover.png)

[Kibana](https://[[HOST_SUBDOMAIN]]-30601-[[KATACODA_HOST]].environments.katacoda.com/app/kibana)


