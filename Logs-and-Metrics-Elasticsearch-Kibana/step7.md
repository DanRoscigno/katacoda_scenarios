#### Deploy Metricbeat

Metricbeat will automatically discover the running pods, find the proper files or ports to collect metrics from, configure Elasticsearch to parse the data, and configure Kibana with sample visualizations and dashboards by looking at the available metadata and applying technology specific modules:

### Create the dashboards and other assets:

`kubectl apply -f /root/course/metricbeat-setup.yaml`{{execute HOST1}}

#### Verify that the setup completes

If you run the following `get pods` command several times you will see the pod go from Creating to running, and then completed.  Do not proceed until it completes.

`kubectl get pods -n kube-system | grep metricbeat`{{execute HOST1}}

#### Deploy Metricbeat

`kubectl apply -f /root/course/metricbeat-kubernetes.yaml`{{execute HOST1}}

#### Verify that Metricbeat is running

`kubectl get pods -n kube-system | grep metricbeat`{{execute HOST1}}

There should be three metricbeat entries, the metricbeat-setup-\* pod should be completed, and two other metricbeat pods will eventually be running.  One metricbeat is for the cluster level metrics and events coming from kube-state-metrics, and the other is for the metrics coming from the pods on node01. If the Metricbeat pods are not running, wait a minute and retry. To see detailed information, you can run the describe command:

`kubectl describe po -l k8s-app=metricbeat -n kube-system`{{execute HOST1}}
