#!/bin/sh
IPCLUSTER=`/sbin/ifconfig ens3 | grep 'inet ' | cut -d: -f2| cut -d' ' -f10`:6443
echo "kubeadm join --token $(kubeadm token list | sed '1d' | head -1| awk '{print $1}') $IPCLUSTER --discovery-token-ca-cert-hash sha256:$(openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | awk '{print $2}')" > /home/centos/join.sh

