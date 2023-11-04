#!/bin/bash

echo "Pull required containers"
kubeadm config images pull >/dev/null 2>&1

echo "Initialize Kubernetes Cluster"
kubeadm init --apiserver-advertise-address=1.1.1.1 --pod-network-cidr=192.168.0.0/16 >> /root/kubeinit.log 2>/dev/null

echo "Deploy Calico network"
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/v3.18/manifests/calico.yaml >/dev/null 2>&1

## echo "Deploy Weavenet network"
## kubectl --kubeconfig=/etc/kubernetes/admin.conf apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml >/dev/null 2>&1

echo "Generate and save cluster join command to /joincluster.sh"
kubeadm token create --print-join-command > /joincluster.sh 2>/dev/null
