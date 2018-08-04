*To manage an application you need logs and metrics from the app, and the infrastructure.  In a Kubernetes environment you want the logs and metrics from the application, the nodes, pods, containers, etc. all in one place. Usinng Elasticsearch, Kibana, and Beats allows you to collect, search, analyze and visualize all of your data in one place.*

If you are reading this, please excuse the dust :)  I am still working on this.  Here are my plans for the near future:

It works, but needs polishing to 
1. send more data (metrics, network, syslog)
2. explain things to the user (start  with an intro  to  the Katacoda  env, and then an intro to Elastic (maybe an animated GIF or video)
3. add more intro material to explain what is going to be seen (probably the above)
4. add a Kibana walk through (give specific  instructions in  the  last  step to suggest where people should be looking, and why)
5. scale up the application and show that in Kibana (show autodiscover in action)
