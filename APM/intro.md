### Welcome

### Why?
Logs and metrics alone are not enough, to really have observability of our applications we need to have Application Performance Mangement with Distributed Tracing, Machine Learning, and Alerting. In this Katacoda scenario we will learn how to enable Elastic APM in a Java application, and then you will add custom instrumentation to a function (the function product()) in that app.  

### Before you begin the scenario
You will need an Elasticsearch Service in Elastic Cloud (https://cloud.elastic.co).  Use an instance that is at least version 6.6.0, as this will include an APM server deployed in Elastic Cloud.  Choose a default deployment, as this will include an APM server. If you customize your deployment, make sure that you deploy an APM server. Make sure to record the credentials presented to you during the spin up of your instance so that you can configure your sample application to connect to the APM server, and so that you can authenticate to your Kibana instance.

### Let's take a look at the goal
During the scenario you will deploy the sample application in Katacoda and then navigate around in the app.  You will then open Kibana (in your Elasticsearch Service instance) and open the APM application.  Here is what you will see (assuming that you generated some traffic by opening some of the pages in the app)
![APM App](https://user-images.githubusercontent.com/25182304/52180095-000ba000-27b0-11e9-9d52-2ea68bae7f92.png)

### A Quick Katacoda Primer
If this is your first time using Katacoda, let me introduce some of the cool ideas:

* In general, you don't need to type.  Most of the time, you can simply click on a command in the instructions to run it.
* There are a couple steps where you will be directed to edit a file.  You can simply click on the blue text on those instruction lines and the file will open in the editor in the top right of the KAtacoda window.  As you type the changes are saved to disk.
![Editor Link](https://user-images.githubusercontent.com/25182304/52179965-4233e200-27ae-11e9-8e6e-efc083d6f994.png)
* There are a couple of times where you will be directed to open Kibana or the sample Java app, clicking on the links provided will open these pages in new tabs.
* Each time you start or restart a course everything gets reset. If you misconfigure something somehow, simply restart the course.

