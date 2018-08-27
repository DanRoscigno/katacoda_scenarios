
`kubectl apply -f /root/course/kibana.yaml`{{execute HOST1}}

### Check out Elastic APM monitoring a Nodejs app

It takes about 90 seconds for Kibana to download to Katacoda and complete the strtup procedure.  While this happens let's look at Elastic Application Performance Management (APM).  Elastic APM shows you the internal workings of your app, and all you do is include a library and provide the URL of an APM Server instance.

[Elastic APM demo](https://demo.elastic.co/app/apm)

### See how easy that is

The best way to see how easy instrumenting your apps is to do it.  Just hop over to https://www.elastic.co/start and follow the instructions to download and run Elasticsearch and Kibana, then click on the Kibana logo at the top left corner of your Kibana instance and click **Add APM**.

Here is how I added APM to a Nodejs app running in Docker for Mac.  See the top few lines:

![APM added to Node](https://user-images.githubusercontent.com/25182304/44667296-695cdb00-a9e8-11e8-91ff-a3d47a12805a.png)

#### Verify that Kibana is running 

Check the pods for Kibana:

`kubectl get pods`{{execute HOST1}}

Check the Kibana logs:  

`kubectl logs kibana|grep "Status changed from yellow to green"`{{execute HOST1}}

Once Kibana is connected to Elasticsearch, it is ready.  Toward the end of the log file, you  will see an entry telling you that the state has gone to **green**

![Kibana log](https://user-images.githubusercontent.com/25182304/43620199-883f336c-969f-11e8-9225-f84006e14fd9.png)
