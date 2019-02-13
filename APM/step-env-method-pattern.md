### No code changes instrumentation

With the Java agents, you can instrument code without changing it at all.

Please take a look at the [trace_methods](https://www.elastic.co/guide/en/apm/agent/java/current/config-core.html#config-trace-methods) documentation.

Try setting :

```
 export ELASTIC_APM_TRACE_METHODS=co.elastic.apm.opbeans.*#*
```
Edit the file `environment` in the Katacoda UI (just click the document icon to the right) and add the above environment variable.
`environment`{{open}}

This will instrument every method of every class in the co.elastic.apm.opbeans package.

Note: There's always a bit of overhead in instrumentation. `trace_methods` is not meant as a way to instrument every method in an application.

### Shutdown your container
`CTRL-C`{{execute interrupt}}


### Make sure the prompt came back
`echo "hi"`{{execute HOST1}}

### and source the updated environment file:
`source /root/course/environment`{{execute HOST1}}


### Re-compile
No need to recompile! We didn't change any code 🎉

### Re-start the application
```docker-compose -f docker-compose-elastic-cloud.yml up --force-recreate```{{execute HOST1}}

### Look at the results in Kibana

1. Take a look at the transactions generated.
For example, in `APIRestController#stats` you can see each individual method called.


