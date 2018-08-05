### Welcome

* To monitor an application running in Kubernetes (k8s), you need logs and metrics from the app, as well as, the k8s environment it's running in. Using Elasticsearch, Kibana, and Beats allows you to collect, search, analyze and visualize all of this data about the app and the k8s (pods, containers, etc) in one place. 

### A Quick Katacoda Primer
If this is your first time using Katacoda, let me introduce some of the cool ideas:

* In general, you don't need to type.  Most of the time, you can simply click on a command in the instructions to run it.
* If you need access to a web browser, look for tabs at the top of the terminal window. In this course you will need two pages - one for the Guestbook application, and one for  Kibana. You should see a *Guestbook* tab and a *Kibana* tab in the terminal.  Once you have the Guestbook app running, click on the "Guestbook* tab to open it in a browser window and make some entries. Likewise, once you have Kibana running you should open that tab and look at the data.
* Each time you start or restart a course everything gets reset. If you misconfigure something somehow, simply restart the course.

### Construction zone - DELETE before sharing
If you are reading this, please excuse the dust :)  I am still working on this.  Here are my plans for the near future:

It works, but needs polishing to 
1. send more data (metrics, network, syslog)
2. explain things to the user (start  with an intro  to  the Katacoda  env, and then an intro to Elastic (maybe an animated GIF or video)
3. add more intro material to explain what is going to be seen (probably the above)
4. add a Kibana walk through (give specific  instructions in  the  last  step to suggest where people should be looking, and why)
5. scale up the application and show that in Kibana (show autodiscover in action)
