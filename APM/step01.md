### Create a default Elasticsearch Service in Elastic Cloud instance
As always, take note of the `elastic` password.  All of the rest of the information you can copy later.

https://cloud.elastic.co/login?redirectTo=%2Fdeployments

### Clone the opbeans demo

This version has a modified docker-compose file to use the APM Server in Elastic Cloud.

`git clone https://github.com/roncohen/opbeans-java.git /root/course/opbeans`{{execute HOST1}}

### Set some environment variables

You need two environment variables set to get the APM measurements to your Elasticsearch Service in Elastic Cloud instance.  Here is where you get them:

![APM URL](https://user-images.githubusercontent.com/25182304/52064727-309ad200-2543-11e9-9097-24e3888455f7.png)

Click on the file `environment` in the Katacoda UI and edit with your settings from the above location

Source the environment variables:
`source /root/course/environment`{{execute HOST1}}

Run the compose:
```
cd /root/course/opbeans/
docker-compose -f ./docker-compose-elastic-cloud.yml up```{{execute HOST1}}
