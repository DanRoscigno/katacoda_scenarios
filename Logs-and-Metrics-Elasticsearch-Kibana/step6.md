#### Deploy Metricbeat

Metricbeat will automatically discover the running pods, find the proper files or ports to collect metrics from, configure Elasticsearch to parse the data, and configure Kibana with sample visualizations and dashboards by looking at the available metadata and applying technology specific modules:

### Create the dashboards and other assets:

`kubectl apply -f /root/course/metricbeat-setup.yaml`{{execute HOST1}}

#### Verify that the setup is running

`kubectl get pods -n kube-system | grep metricbeat`{{execute HOST1}}

#### Deploy Metricbeat

`kubectl apply -f /root/course/metricbeat-kubernetes.yaml`{{execute HOST1}}

#### Verify that Metricbeat is running

`kubectl get pods -n kube-system | grep metricbeat`{{execute HOST1}}

If the Metricbeat pod is not running, wait a minute and retry. To see detailed information, you can run the describe command:

`kubectl describe po -l k8s-app=metricbeat -n kube-system`{{execute HOST1}}
