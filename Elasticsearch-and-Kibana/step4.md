Now deploy Kibana.

`kubectl apply -f /root/course/kibana.yaml`{{execute HOST1}}

Verify that the kibana pod has started:

`kubectl get pods`{{execute HOST1}}

Check the Kibana logs.  

`kubectl logs kibana`{{execute HOST1}}

When Kibana is connected to Elasticsearch it is ready.  Toward the end of the log file you  will see an entry telling you that the state has gone to *green*
