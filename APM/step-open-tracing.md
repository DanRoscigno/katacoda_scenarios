### Open Tracing

As you know, Open Tracing is a vendor independent API. We will try to add custom Open Tracing custom instrumentation in this step.

First, you need to instantiate the `Tracer` globally in the application.

Open `opbeans/opbeans/src/main/java/co/elastic/apm/opbeans/OpbeansApplication.java`{{open}}

Add code that will register Elastic APM as the global tracer for Open Tracing `main`: 

```
GlobalTracer.register(new ElasticApmTracer());
```

You will need to add the right imports.

Open APIRestController.java `opbeans/opbeans/src/main/java/co/elastic/apm/opbeans/controllers/APIRestController.java`{{open}} again.

Replace your instrumentation @CaptureSpan instrumentation with an Open Tracing instrumentation:


```
@GetMapping("/products/{productId}")
ProductDetail   (@PathVariable long productId) {
    final Span span = tracer.buildSpan("OpenTracing product span")
            .withTag("productId", Long.toString(productId))
            .start();
    try (Scope scope = tracer.scopeManager().activate(span, false)) {
        return productRepository.getOneDetail(productId);
    } finally {
        span.finish();
    }
}
```


### Shutdown your container
`CTRL-C`{{execute interrupt}}


### Re-compile
```cd /root/course/opbeans/
docker-compose -f docker-compose-elastic-cloud.yml build```{{execute HOST1}} 


### Re-start the application
```
docker-compose -f docker-compose-elastic-cloud.yml up --force-recreate```{{execute HOST1}}

### Look at the results in Kibana

1. When the application has started up again, generate some traffic by browser around the site: https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com/
1. Then go look at the opbeans app in Kibana
1. Find the "Product" transaction in Kibana and try to find your new Span and the tag you set.

