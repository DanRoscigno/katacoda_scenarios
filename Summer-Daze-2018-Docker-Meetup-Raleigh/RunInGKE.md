
`kubectl get nodes`

If the command returns *NotReady*, then wait a couple of seconds before retrying.
heapster is a container provided by Kubernetes to make metrics about Nodes, pods, etc. available.  If you ever ran `kubectl top pods` you have interacted with heapster. Metricbeat polls heapster for metrics and provides them to Elasticsearch. heapster can use various backends, we will deploy InfluxDB here.

### Clone the heapster repo:

`git clone https://github.com/kubernetes/heapster.git /root/course/heapster`

### Deploy InfluxDB, Grafana, and heapster

`kubectl create -f /root/course/heapster/deploy/kube-config/influxdb/`

### Configure RBAC for heapster

`kubectl create -f /root/course/heapster/deploy/kube-config/rbac/heapster-rbac.yaml`

### Verify that heapster is available

You should see one running heapster pod:

`kubectl get pods -n kube-system | grep -E "monitoring|heapster"`
Deploy the Guestbook application by running the `kubectl apply` command:

`kubectl apply -f /root/course/guestbook.yaml`

### Check to see if the pods are running:

`kubectl get pods`

If all the pods (a frontend, and two redis) are not running, then wait a minute and run the `kubectl get pods` command again. 

### Make some entries in the Guestbook

Once the pods are all running, switch to the **Guestbook** tab and enter some messages into the Guestbook.
Filebeat will connect to Elasticsearch and Kibana running in the Kubernetes cluster.  

#### Deploy Elasticsearch:

`kubectl apply -f /root/course/es.yaml`

**Note**: This YAML file is deploying Elasticsearch without a persistent store, as this course is meant to live for less than 30 minutes.  Do not use es.yaml to deploy Elasticsearch for real use. You should use our official Docker images found at http://www.docker.elastic.co

### Check out some demos

It takes about 90 seconds for Elasticsearch to download to Katacoda and complete the strtup procedure.  While this happens let's look at some of the Docker containers being monitored at https://demo.elastic.co/

#### Verify that Elasticsearch is running

Checking the pods:

`kubectl get pods`

Checking the logs:

`kubectl logs es | grep "mode \[basic\] - valid"`

When Elasticsearch is fully initialized, you will see a log entry indicating that the license file is valid.

![Elasticsearch log](https://user-images.githubusercontent.com/25182304/43620198-8830e4a6-969f-11e8-9c05-0cd6ffc5ab96.png)

`kubectl apply -f /root/course/kibana.yaml`

### Check out Elastic APM monitoring a Nodejs app

It takes about 90 seconds for Kibana to download to Katacoda and complete the strtup procedure.  While this happens let's look at Elastic Application Performance Management (APM).  Elastic APM shows you the internal workings of your app, and all you do is include a library and provide the URL of an APM Server instance.

[Elastic APM demo](https://demo.elastic.co/app/apm)

### See how easy that is

The best way to see how easy instrumenting your apps is to do it.  Just hop over to https://www.elastic.co/start and follow the instructions to download and run Elasticsearch and Kibana, then click on the Kibana logo at the top left corner of your Kibana instance and click **Add APM**.

Here is how I added APM to a Nodejs app running in Docker for Mac.  See the top few lines:

![APM added to Node](https://user-images.githubusercontent.com/25182304/44667296-695cdb00-a9e8-11e8-91ff-a3d47a12805a.png)

#### Verify that Kibana is running 

Check the pods for Kibana:

`kubectl get pods`

Check the Kibana logs:  

`kubectl logs kibana|grep "Status changed from yellow to green"`

Once Kibana is connected to Elasticsearch, it is ready.  Toward the end of the log file, you  will see an entry telling you that the state has gone to **green**

![Kibana log](https://user-images.githubusercontent.com/25182304/43620199-883f336c-969f-11e8-9225-f84006e14fd9.png)
Filebeat will automatically discover the running pods, find the proper files, configure Elasticsearch to parse the logs, and configure Kibana with sample visualizations and dashboards by looking at the available metadata and applying technology specific modules.

#### Deploy Filebeat

`kubectl apply -f /root/course/filebeat-kubernetes.yaml`

#### Let's look at how autodiscover is configured

There is plenty of information available in the metadata that Docker and Kubernetes publish about our deployments, containers, etc.  Take a look at kubectl describe for our Redis master pod:

`kubectl describe pod -l role=master`

If we look just at the Labels section we can see:

`kubectl describe pod -l role=master | grep -A 3 "^Labels:"`

```yaml
Labels:       app=redis
                pod-template-hash=3398316229
                role=master
                tier=backend
```

Now take a look at the Filebeat autodiscover config (click the image to zoom) and see that we are matching on the app label to use the Redis module for pods with a label `app` containing the string `redis`.:

![Filebeat Autodiscover](https://user-images.githubusercontent.com/25182304/44665809-d53d4480-a9e4-11e8-812c-eb3a3a9706e6.png)

#### Verify that Filebeat is running

`kubectl get pods -n kube-system | grep filebeat`

If the Filebeat pod is not running, wait a minute and retry. To see detailed information, you can run the describe command:

`kubectl describe po -l k8s-app=filebeat-dynamic -n kube-system`
#### Deploy kube-state-metrics

kube-state-metrics is a container provided by Kubernetes to make the state of pods, nodes, deployments, etc. available.  Metricbeat polls kube-state-metrics for events and provides them to Elasticsearch. 

### Clone the kube-state-metrics repo:

`git clone https://github.com/kubernetes/kube-state-metrics.git /root/course/kube-state-metrics`

### Deploy kube-state-metrics

`kubectl apply -f /root/course/kube-state-metrics/kubernetes`

### Verify that kube-state-metrics is available

You should see one running kube-state-metrics pod, a second one may show up in the list in Terminating state:

`kubectl get po -l k8s-app=kube-state-metrics -n kube-system`
#### Deploy Metricbeat

Metricbeat will automatically discover the running pods, find the proper files or ports to collect metrics from, configure Elasticsearch to parse the data, and configure Kibana with sample visualizations and dashboards by looking at the available metadata and applying technology specific modules:

### Create the dashboards and other assets:

`kubectl apply -f /root/course/metricbeat-setup.yaml`

#### Verify that the setup completes

If you run the following `get pods` command several times you will see the pod go from ContainerCreating to Running, and then Completed.  Do not proceed until it completes.

`kubectl get pods -n kube-system | grep metricbeat`

#### Deploy Metricbeat

`kubectl apply -f /root/course/metricbeat-kubernetes.yaml`

#### Verify that Metricbeat is running

`kubectl get pods -n kube-system | grep metricbeat`

There should be three metricbeat entries, the metricbeat-setup-\* pod should be completed, and two other metricbeat pods will eventually be running.  One metricbeat is for the cluster level metrics and events coming from kube-state-metrics, and the other is for the metrics coming from the pods on node01. If the Metricbeat pods are not running, wait a minute and retry. To see detailed information, you can run the describe command:

`kubectl describe po -l k8s-app=metricbeat -n kube-system`
If you have not not yet made entries in the Guestbook, go ahead and do so now. The **Guestbook** tab is right next to the **Kibana** tab at the top of the terminal.

Launch Kibana by clicking on the **Kibana** tab at the top of your terminal. 

#### Configure Defaults
You should now have indices for Filebeat and Metricbeat in Elasticsearch.   In order to use Kibana to search and visualize the information in those indices you have to set one of the patterns **filebeat-\*** or **metricbeat-\*** as the default.  Click on **Management** and then **Index Patterns**.

![abc](https://user-images.githubusercontent.com/25182304/43741865-d552ac5a-999d-11e8-9c27-3ce5ef38ecc8.png)

Choose one of the patterns by clicking on it.  I generally set **metricbeat-\*** as the default, so that is what the screenshots will show.

![ghi](https://user-images.githubusercontent.com/25182304/43741879-de52cb28-999d-11e8-9d2d-02f8cb965e38.png)

Click the stat on the far right of the page to make your index pattern the default

![mno](https://user-images.githubusercontent.com/25182304/43741884-e1462d84-999d-11e8-9977-45ae5a2975da.png)

Select yes or no to share basic usage information with Elastic

![stu](https://user-images.githubusercontent.com/25182304/43741889-e78c71e4-999d-11e8-8d4a-830c752cf136.png)


#### Explore Data

If you made entries in the Guestbook earlier in the demo, you should be able to see these in the Kibana Discover app, and in the [Filebeat Apache2] Access and Error Logs dashboard. The Guestbook application relies on Redis to store data, so the Redis dashboards will also have data.

- [Apache Dashboards](https://[[HOST_SUBDOMAIN]]-30601-[[KATACODA_HOST]].environments.katacoda.com/app/kibana#/dashboards?filter=apache)
- [Apache Saved Search](https://[[HOST_SUBDOMAIN]]-30601-[[KATACODA_HOST]].environments.katacoda.com/app/kibana#/discover/Apache2-access-logs)
- [Redis Dashboards](https://[[HOST_SUBDOMAIN]]-30601-[[KATACODA_HOST]].environments.katacoda.com/app/kibana#/dashboards?notFound=dashboard&filter=redis)
- [Kibana](https://[[HOST_SUBDOMAIN]]-30601-[[KATACODA_HOST]].environments.katacoda.com/app/kibana)

Event is one of the metric sets in the Metricbeat Kubernetes module, and it lets us know when things happen.  In this case we will look for notifications related to scaling k8s deployments up or down.

#### Scale your deployments and see new pods being monitored

List the existing deployments:
`kubectl get deployments`

Scale the frontend up to two pods:
`kubectl scale --replicas=2 deployment/frontend`

Check the frontend deployment:
`kubectl get deployment frontend`

#### View the changes in Kibana
See the screenshot, add the indicated filters and then add the columns to the view.  You can see the ScalingReplicaSet entry that is marked, following from there to the top of the list of events shows the image being pulled, the volumes mounted, the pod starting, etc.
![Kibana Discover](https://raw.githubusercontent.com/elastic/examples/master/MonitoringKubernetes/scaling-discover.png)

[Kibana](https://[[HOST_SUBDOMAIN]]-30601-[[KATACODA_HOST]].environments.katacoda.com/app/kibana)
You just scaled the frontend deployment, now pull the most recent two minutes of logs for the deployment:

`kubectl logs deployment/frontend --since=2m`

and the related events:

`kubectl get events -n default|grep frontend`

Look at the CPU and memory use of the pods in the default namespace:

`kubectl top pods`

Look at the CPU and memory use of the Nodes:

`kubectl top nodes`
