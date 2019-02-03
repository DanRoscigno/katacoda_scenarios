### Welcome

### Why?
Logs and metrics alone are not enough, to really have observability of our applications we need to have Application Performance Mangement with Distributed Tracing, Machine Learning, and Alerting. In this Katacoda scenario we will learn how to enable Elastic APM in a Java application, and then you will add custom instrumentation to a function (the function product()) in that app.  

### Let's take a look at the goal
This is one of the out of the box dashboards that you will see once you deploy the Elastic Stack in this Katacoda environment.  This is the Docker metrics dashboard that ships with Metricbeat.  It shows an overview of the CPU and Memory use of every container, allows you to drill in to a specific container, and the containers per node.  Looking at the dashboard is much easier than running the equivalent kubectl get, top, describe, etc. commands.

![Docker Dash](https://user-images.githubusercontent.com/25182304/44353691-c2bb8c00-a475-11e8-8d0e-9578c5c8cc47.png)

### A Quick Katacoda Primer
If this is your first time using Katacoda, let me introduce some of the cool ideas:

* In general, you don't need to type.  Most of the time, you can simply click on a command in the instructions to run it.
* There are a couple steps where you will be directed to edit a file.  You can simply click on the blue text on those instruction lines and the file will open in the editor in the top right of the KAtacoda window.  As you type the changes are saved to disk.
![Editor Link](https://user-images.githubusercontent.com/25182304/52179965-4233e200-27ae-11e9-8e6e-efc083d6f994.png)
* There are a couple of times where you will be directed to open Kibana or the sample Java app, clicking on the links provided will open these pages in new tabs.
* Each time you start or restart a course everything gets reset. If you misconfigure something somehow, simply restart the course.

