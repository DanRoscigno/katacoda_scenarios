heapster is a container provided by Kubernetes to make metrics about Nodes, pods, etc. available.  If you ever ran `kubectl top pods` you have interacted with heapster. Metricbeat polls heapster for metrics and provides them to Elasticsearch. heapster can use various backends, we will deploy InfluxDB here.

### Clone the heapster repo:

`git clone https://github.com/kubernetes/heapster.git /root/course/heapster`{{execute HOST1}}

### Deploy InfluxDB

`kubectl create -f /root/course/heapster/deploy/kube-config/influxdb/`{{execute HOST1}}

### Deploy heapster

`kubectl create -f /root/course/heapster/deploy/kube-config/rbac/heapster-rbac.yaml`{{execute HOST1}}

### Verify that heapster is available

You should see one running heapster pod:

`kubectl get pods -n kube-system|grep heapster`{{execute HOST1}}
