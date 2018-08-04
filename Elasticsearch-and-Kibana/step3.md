Filebeat will connect to Elasticsearch and Kibana running in the Kubernetes Cluster.  Deploy Elasticsearch:

`kubectl apply -f /root/course/es.yaml`{{execute HOST1}}

Note: This YAML file is deploying Elasticsearch without a persistent store, as this course is meant ot live for ten or twenty minutes.  Do not use es.yaml to deploy Elasticsearch for real use.  You should use our official Docker images found at http://docker.elastic.co

Verify that Elasticsearch is running by checking the pod:

`kubectl get pods`{{execute HOST1}}

and by checking the logs:

`kubectl logs es`{{execute HOST1}}

When Elasticsearch is fully initialized you will see a log entry indicating that the license file is valid.

![Elasticsearch log](https://user-images.githubusercontent.com/25182304/43620198-8830e4a6-969f-11e8-9c05-0cd6ffc5ab96.png)
