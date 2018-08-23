#### Deploy kube-state-metrics

kube-state-metrics is a container provided by Kubernetes to make the state of pods, nodes, deployments, etc. available.  Metricbeat polls kube-state-metrics for events and provides them to Elasticsearch. 

### Clone the kube-state-metrics repo:

`git clone https://github.com/kubernetes/kube-state-metrics.git /root/course/kube-state-metrics`{{execute HOST1}}

### Deploy kube-state-metrics

`kubectl apply -f /root/course/kube-state-metrics/kubernetes`{{execute HOST1}}

### Verify that kube-state-metrics is available

You should see one running kube-state-metrics pod, a second one may show up in the list in Terminating state:

`kubectl get po -l k8s-app=kube-state-metrics -n kube-system`{{execute HOST1}}

git clone https://github.com/kubernetes/heapster.git /root/course/heapster
kubectl create -f /root/course/heapster/deploy/kube-config/influxdb/
kubectl create -f /root/course/heapster/deploy/kube-config/rbac/heapster-rbac.yaml
kubectl get pods -n kube-system|grep heapster

