#!/bin/bash
kubectl exec -it docker -- sh -c "\
docker version;\
apk update;\
apk add -f curl git mc pax vim unzip zip;\
git clone https://github.com/matthias-haase/ingress-nginx.git;\
cd /ingress-nginx;\
git checkout patch-opentelemetry-cpp-and-contrib-and-proto;\
git status;\
ls;\
echo END;"