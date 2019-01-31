### Create a default Elasticsearch Service in Elastic Cloud instance
As always, take note of the `elastic` password.  All of the rest of the information you can copy later.

https://cloud.elastic.co/login?redirectTo=%2Fdeployments

### Clone the opbeans demo

This version has a modified docker-compose file to use the APM Server in Elastic Cloud.

`git clone https://github.com/roncohen/opbeans-java.git /root/course/opbeans`{{execute HOST1}}

### Copy some environment variables

You need two environment variables set to get the APM measurements to your Elasticsearch Service in Elastic Cloud instance.  Here is where you get them:

![APM URL](https://user-images.githubusercontent.com/25182304/52072876-0ef61680-2554-11e9-9068-ad626da21397.png)

### Set the environment variables

Click on the file `environment` in the Katacoda UI and edit with your settings from the above location
`/root/course/environment`{{open}}

or `environment`{{open}}

Source the environment variables:
`source /root/course/environment`{{execute HOST1}}

### Deploy the opbeans demo

This takes five minutes, maybe longer.  Run the command and make a coffee:

Run the compose:
```cd /root/course/opbeans/
docker-compose -f ./docker-compose-elastic-cloud.yml up```{{execute HOST1}}

### Look at the results in Kibana

### Shutdown your container

```cd /root/course/opbeans/
docker-compose -f ./docker-compose-elastic-cloud.yml up```{{execute HOST1}} 

### Add a custom span


### Rebuild
```cd /root/course/opbeans
docker-compose -f docker-compose-elastic-cloud.yml up --force-recreate```{{execute HOST1}}

