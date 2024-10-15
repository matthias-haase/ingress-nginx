#!/bin/bash
docker stop docker
docker rm docker
sudo docker run --name=docker --group-add=0 --privileged --security-opt seccomp=unconfined --user=0 -v /var/run/docker.sock:/var/run/docker.sock -d docker sh -c "while true; do sleep 2000; done"
docker exec -it docker sh

# kubectl exec -it docker -- sh -c "\
# docker version;\
# apk update;\
# apk add -f curl git mc vim unzip zip;\
# git clone https://github.com/matthias-haase/ingress-nginx.git;\
# cd /ingress-nginx;\
# git checkout patch-opentelemetry-cpp-and-contrib-and-proto;\
# git status;\
# cd /ingress-nginx/images/nginx/rootfs;\
# docker build . 2>&1|tee /build.log;\
# ls;\
# echo END;"