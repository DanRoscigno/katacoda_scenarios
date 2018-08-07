#!/bin/sh
apt-get -y install golang

export GOROOT=/usr/local/go

export GOPATH=$HOME/go

export PATH=$PATH:$GOROOT/bin

# From here down is specific to kube-state-metrics

go get k8s.io/kube-state-metrics

cd $GOPATH/src/k8s.io/kube-state-metrics/

make container

kubectl apply -f kubernetes

