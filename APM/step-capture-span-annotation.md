
### This will teach you to add a custom instrumentation though Java annotations

Open APIRestController.java `opbeans/opbeans/src/main/java/co/elastic/apm/opbeans/controllers/APIRestController.java`{{open}}

We want to add a span that measure the time spent in the method "product()" (note: singular)

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


### Re-compile
```cd /root/course/opbeans/
docker-compose -f docker-compose-elastic-cloud.yml build```{{execute HOST1}} 


### Re-start the application
```
docker-compose -f docker-compose-elastic-cloud.yml up --force-recreate```{{execute HOST1}}


### Look at the results in Kibana

1. When the application has started up again, generate some trafic by browser around the site.
1. Then go look at the opbeans app in Kibana
1. Find the "Products" transaction in Kibana and try to find your new Span and the tag you set.

