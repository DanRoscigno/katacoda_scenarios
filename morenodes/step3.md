Filebeat will use connection and authentication information stored in a Kubernetes secret.  Populate the secret *dynamic-logging* by editing the files *ELASTIC_PASSWORD* and *CLOUD_ID* and then running the *kubectl create secret* command.

`vi ELASTIC_PASSWORD`{{execute}}

`vi CLOUD_ID`{{execute}}

`kubectl create secret generic dynamic-logging \
--from-file=./ELASTIC_PASSWORD --from-file=./CLOUD_ID \
--namespace=kube-system`{{execute}}

