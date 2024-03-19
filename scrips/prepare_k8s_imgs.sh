#!/bin/bash

VERSION=1.28.0

images=$(kubeadm config images list --kubernetes-version=v${VERSION} | awk -F "/"  '{print $NF}')

images_download(){
    for i in ${images};do
        nerdctl pull registry.aliyuncs.com/google_containers/$i
    done
}

images_push(){
    for i in ${images};do
        nerdctl tag registry.aliyuncs.com/google_containers/$i 127.0.0.1:5000/$i
	nerdctl push 127.0.0.1:5000/$i --insecure-registry
    done
}

images_pull(){
    ctr ns c k8s.io
    for i in ${images};do
        ctr -n k8s.io i pull --plain-http 127.0.0.1:5000/$i
    done
}

#images_download
#images_push
images_pull
