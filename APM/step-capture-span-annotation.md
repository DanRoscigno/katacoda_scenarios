
### This will teach you to add a custom instrumentation though Java annotations

Open APIRestController.java `opbeans/opbeans/src/main/java/co/elastic/apm/opbeans/controllers/APIRestController.java`{{open}}

We want to add a span that measure the time spent in the method "products()".

See the documentation to understand how @CaptureSpan works: https://www.elastic.co/guide/en/apm/agent/java/master/public-api.html#api-capture-span

Add the span now.

### Adding a tag to a span

It might be useful to capture some additional data with the span. For this we can use tags.
See the documentation around adding tags to spans: https://www.elastic.co/guide/en/apm/agent/java/master/public-api.html#api-span-add-tag

You can always get the currently active span by calling: 

`ElasticApm.currentSpan()`

Please add the tag to the span now.

### Shutdown your container
`CTRL-C`{{execute interrupt}}

```cd /root/course/opbeans/
docker-compose -f ./docker-compose-elastic-cloud.yml up```{{execute HOST1}} 


### Rebuild
```cd /root/course/opbeans
docker-compose -f docker-compose-elastic-cloud.yml up --force-recreate```{{execute HOST1}}

### Look at the results in Kibana
