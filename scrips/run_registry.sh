#!/bin/bash

nerdctl run -d -p 5000:5000 --restart=always --name registry -v /opt/registry:/var/lib/registry -e REGISTRY_STORAGE_DELETE_ENABLED=true registry:latest
