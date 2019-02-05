### Distributed Tracing

Distributed Tracing is the ability to follow a trace through multiple systems.

We can demonstrate distributed tracing by booting up more services and have them talking to each other and then watch the traces generated.

On the APM team we have an "opbeans" application that is written in every programming language that our agents support. We have a simple tool that boots them all up and make them talk to each other.

Let's try to start it now.

Run `git clone https://github.com/roncohen/apm-integration-testing.git`{{execute HOST1}}

Then, run the following commands to start the other opbeans apps:

```cd apm-integration-testing
git checkout explicit-networks
./scripts/compose.py start master --apm-server-url=$ELASTIC_APM_SERVER_URL --apm-server-secret-token=$ELASTIC_APM_SECRET_TOKEN --no-apm-server --no-elasticsearch --no-kibana --with-opbeans-node --with-opbeans-ruby --with-opbeans-go  --with-metricbeat --with-filebeat```{{execute HOST1}}

This will take a little while.

