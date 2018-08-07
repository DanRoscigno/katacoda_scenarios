#### Deploy kube-state-metrics

kube-state-metrics is a container provided by Kubernetes to make the state of pods, nodes, deployments, etc. available.  Metricbeat polls kube-state-metrics for events and provides them to Elasticsearch. A shell script will install golang, build the container, and deploy it into the kube-system namespace.

`sh /root/course/kube-state.sh`{{execute HOST1}}

