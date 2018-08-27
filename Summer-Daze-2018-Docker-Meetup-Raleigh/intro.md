### Welcome

### Places to learn Docker and Kubernetes
- Katacoda.com
- Play with Docker

### Elastic specific resources
- [Container Monitoring](https://www.elastic.co/docker-kubernetes-container-monitoring) home at Elastic
- Our [Official Containers](https://www.docker.elastic.co/) at Elastic
- Elastic’s [scenarios](https://www.katacoda.com/dan_roscigno/) at Katacoda
- [Source](https://github.com/DanRoscigno/katacoda_scenarios) for Elastic’s scenarios
- [Docker Compose Files](https://github.com/elastic/stack-docker) for the whole Elastic stack

### Why?
To monitor an application running in Kubernetes (k8s), you need logs and metrics from the app, as well as, the k8s environment it's running in. Using Elasticsearch, Kibana, and Beats allows you to collect, search, analyze and visualize all of this data about the app and the k8s (pods, containers, etc) in one place. 

### Let's take a look at the goal
This is one of the out of the box dashboards that you will see once you deploy the Elastic Stack in this Katacoda environment.  This is the Docker metrics dashboard that ships with Metricbeat.  It shows an overview of the CPU and Memory use of every container, allows you to drill in to a specific container, and the containers per node.  Looking at the dashboard is much easier than running the equivalent kubectl get, top, describe, etc. commands.

![Docker Dash](https://user-images.githubusercontent.com/25182304/44353691-c2bb8c00-a475-11e8-8d0e-9578c5c8cc47.png)

### A Quick Katacoda Primer
If this is your first time using Katacoda, let me introduce some of the cool ideas:

* In general, you don't need to type.  Most of the time, you can simply click on a command in the instructions to run it.
* If you need access to a web browser, look for tabs at the top of the terminal window. In this course you will need two pages - one for the Guestbook application, and one for  Kibana. You should see a *Guestbook* tab and a *Kibana* tab in the terminal.  Once you have the Guestbook app running, click on the "Guestbook* tab to open it in a browser window and make some entries. Likewise, once you have Kibana running you should open that tab and look at the data.
* Each time you start or restart a course everything gets reset. If you misconfigure something somehow, simply restart the course.

