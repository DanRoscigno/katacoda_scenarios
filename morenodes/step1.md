Start your Kubernetes cluster by running *launch.sh*:
`kubeadm init --token=102952.1a7dd4cc8d1f4cc6`{{execute HOST1}}

Wait until init finishes on host1 and then:

`kubeadm join --token=102952.1a7dd4cc8d1f4cc6 --discovery-token-unsafe-skip-ca-verification [[HOST_IP]]:6443`{{execute HOST2}}

```
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
```{{execute HOST1}}

You will see that the nodes are not ready, even if they are as the network is down:
`kubectl get nodes`{{execute HOST1}}

Start the network:

`kubectl apply -f /opt/weave-kube`{{execute HOST1}}

Now check the nodes:

`kubectl get nodes`{{execute HOST1}}

If the node returns NotReady then it is still waiting. Wait a couple of seconds before retrying.
