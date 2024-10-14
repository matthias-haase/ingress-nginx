#!/bin/bash
kubectl apply -f docker-pod.yaml
kubectl wait -n default --for=condition=Ready pod --all
kubectl exec -it docker -- sh -c "\
docker version;\
apk update;\
apk add -f curl git mc vim unzip zip;\
git clone https://github.com/matthias-haase/ingress-nginx.git;\
cd /ingress-nginx;\
git checkout patch-opentelemetry-cpp-and-contrib-and-proto;\
git status;\
cd /ingress-nginx/images/nginx/rootfs;\
sh build.sh;\
ls;\
echo END;"