A Kubernetes cluster started when you began the scenario. Run the `kubectl get nodes` command to see if the nodes are in the *Ready* state:

`git clone https://github.com/roncohen/opbeans-java.git /root/course/opbeans`{{execute HOST1}}

blah blah blah

You need four environment variables set to get the APM measurements to your Elasticsearch Service in Elastic Cloud instance.  Here is where you get them:

![Cloud Creds](https://user-images.githubusercontent.com/25182304/52064722-2ed10e80-2543-11e9-86bf-37fbd49fb24c.png)

![APM URL](https://user-images.githubusercontent.com/25182304/52064727-309ad200-2543-11e9-9097-24e3888455f7.png)

Click on the file `environment` in the Katacoda UI and edit with your settings from the above two locations

Source the environment variables:
`source /root/course/environment`{{execute HOST1}}

Run the compose:
```
cd /root/course/opbeans/
`docker-compose -f ./docker-compose-elastic-cloud.yml up```{{execute HOST1}}
