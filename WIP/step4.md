#### Deploy Kibana

`kubectl apply -f /root/course/kibana.yaml`{{execute HOST1}}

#### Verify that Kibana is running 

Check the pods of Kibana:

`kubectl get pods`{{execute HOST1}}

Check the Kibana logs.  

`kubectl logs kibana`{{execute HOST1}}

Once Kibana is connected to Elasticsearch, it is ready.  Toward the end of the log file, you  will see an entry telling you that the state has gone to **green**

![Kibana log](https://user-images.githubusercontent.com/25182304/43620199-883f336c-969f-11e8-9225-f84006e14fd9.png)
