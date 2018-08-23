Filebeat will automatically discover the running pods, find the proper files, configure Elasticsearch to parse the logs, and configure Kibana with sample visualizations and dashboards by looking at the available metadata and applying technology specific modules.

#### Deploy Filebeat

`kubectl apply -f /root/course/filebeat-kubernetes.yaml`{{execute HOST1}}

#### Verify that Filebeat is running

`kubectl get pods -n kube-system | grep filebeat`{{execute HOST1}}

If the Filebeat pod is not running, wait a minute and retry. To see detailed information, you can run the describe command:

`kubectl describe po -l k8s-app=filebeat-dynamic -n kube-system`{{execute HOST1}}
