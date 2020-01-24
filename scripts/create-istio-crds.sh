#!/bin/sh
for i in /home/centos/istio/istio-1.3.1/install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl apply -f $i; done
