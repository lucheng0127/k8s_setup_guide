#!/bin/bash

swapoff -a
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
