### No code changes instrumentation

With the Java agents, you can instrument code without changing it at all.

Please take a look at the [trace_methods](https://www.elastic.co/guide/en/apm/agent/java/current/config-core.html#config-trace-methods) documentation.

Try setting :

```
 export ELASTIC_APM_TRACE_METHODS=co.elastic.apm.opbeans.*#*
```


### Shutdown your container
`CTRL-C`{{execute interrupt}}


### Re-compile
No need to recompile! We didn't change any code 🎉

### Re-start the application
```docker-compose -f docker-compose-elastic-cloud.yml up --force-recreate```{{execute HOST1}}

### Look at the results in Kibana

1. Take a look at the transactions generated and see each individual method show up.


