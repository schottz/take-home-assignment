#!/bin/bash

IMAGE_NAME="schottz/dockerize"
TAG=$(date +"%s")

docker build -t $IMAGE_NAME ../dockerize/
docker tag $IMAGE_NAME:latest $IMAGE_NAME:$TAG

sed -e "s#MY_NEW_IMAGE#$IMAGE_NAME:$TAG#g" script.yaml > new-app.yaml

kubectl diff -f ./new-app.yaml