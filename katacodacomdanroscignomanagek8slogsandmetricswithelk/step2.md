Deploy the Guestbook application by running the *kubectl apply -f guestbook.yaml* command:

`kubectl apply -f guestbook.yaml`{{execute}}

`kubectl get pods`{{execute}}

If the pods are not all running, then wait a minute and run the *kubectl get pods* command again.

"environment": {
  "showdashboard": true,
  "dashboards": [{"name": "Display 80", "port": 80}, {"name": "Display 8080", "port": 8080}],
}
