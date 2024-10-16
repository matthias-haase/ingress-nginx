#!/bin/bash
# /ingress-nginx# make build image
#
BASENAME=$(basename $0)
for file in $(find . -type f|xargs grep BASE_IMAGE|cut -d: -f1|sort -u|grep -vE "~$")
do
	cat $file|nl|grep -B2 -A2 BASE_IMAGE|awk '{print FILE ":" $_}' FILE=$file
done|grep -iE "from.*BASE_IMAGE"|grep -v $BASENAME