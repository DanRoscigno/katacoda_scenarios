Now deploy Filebeat.  Filebeat will automatically discover the running pods, find the proper files, configure Elasticsearch to parse the logs, and configure Kibana with sample visualizations and dashboards by looking at the available metadata and applying technology specific modules:

`kubectl apply -f /root/course/filebeat-kubernetes.yaml`{{execute}}

`kubectl get pods -n kube-system | grep filebeat`{{execute}}

If the Filbeat pods are not running wait a minute and retry, to see detailed information you can run the command *kubectl describe pod <filebeat pod name> -n kube-system*
