#!/bin/bash

# Variables
IMAGE_NAME="tpathak21/nginx-reverse-proxy"
TAG="v1.0"
DOCKERFILE_DIR="./nginx"

echo " Building Docker image..."
docker build -t $IMAGE_NAME:$TAG $DOCKERFILE_DIR

if [ $? -ne 0 ]; then
  echo " Docker build failed!"
  exit 1
fi

echo " Pushing Docker image to Docker Hub..."
docker push $IMAGE_NAME:$TAG

if [ $? -ne 0 ]; then
  echo " Docker push failed!"
  exit 1
fi

echo "Done: $IMAGE_NAME:$TAG"
