#!/bin/bash

modprobe br_netfilter
kubeadm init --image-repository 127.0.0.1:5000 --kubernetes-version 1.28.0 --apiserver-advertise-address 172.17.15.206 --service-cidr 192.168.223.0/24 --pod-network-cidr 10.244.0.0/16
export KUBECONFIG=/etc/kubernetes/admin.conf
