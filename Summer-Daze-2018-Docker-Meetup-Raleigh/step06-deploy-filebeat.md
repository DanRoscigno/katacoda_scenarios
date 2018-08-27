Filebeat will automatically discover the running pods, find the proper files, configure Elasticsearch to parse the logs, and configure Kibana with sample visualizations and dashboards by looking at the available metadata and applying technology specific modules.

#### Deploy Filebeat

`kubectl apply -f /root/course/filebeat-kubernetes.yaml`{{execute HOST1}}

#### Let's look at how autodiscover is configured

There is plenty of information available in the metadata that Docker and Kubernetes publish about our deployments, containers, etc.  Take a look at kubectl describe for our Redis master pod:

`kubectl describe pod -l role=master`{{execute HOST1}}

If we look at the Labels section we can see:
```yaml
Labels:       app=redis
                pod-template-hash=3398316229
                role=master
                tier=backend
```

Now take a look at the Filebeat autodiscover config (click the image to zoom) and see that we are matching on the app label to use the Redis module for pods with a label `app` containing the string `redis`.:

![Filebeat Autodiscover](https://user-images.githubusercontent.com/25182304/44665809-d53d4480-a9e4-11e8-812c-eb3a3a9706e6.png)

#### Verify that Filebeat is running

`kubectl get pods -n kube-system | grep filebeat`{{execute HOST1}}

If the Filebeat pod is not running, wait a minute and retry. To see detailed information, you can run the describe command:

`kubectl describe po -l k8s-app=filebeat-dynamic -n kube-system`{{execute HOST1}}
