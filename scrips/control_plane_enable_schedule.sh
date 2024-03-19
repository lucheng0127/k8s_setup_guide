#!/bin/bash

kubectl taint nodes <master node> node-role.kubernetes.io/control-plane-
