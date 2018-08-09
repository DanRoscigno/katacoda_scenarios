#### Deploy kube-state-metrics

kube-state-metrics is a container provided by Kubernetes to make the state of pods, nodes, deployments, etc. available.  Metricbeat polls kube-state-metrics for events and provides them to Elasticsearch. It was deployed in the background when you started this scenario.  Verify that it is available.

`kubectl get po -l k8s-app=kube-state-metrics`{{execute HOST1}}

