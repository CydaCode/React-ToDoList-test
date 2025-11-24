#!/bin/bash

echo "Pulling the docker image for deployment"

docker pull $DOCKER_USERNAME/wtf_repo:be_v1
docker pull $DOCKER_USERNAME/wtf_repo:fe_v1

echo "Restarting container"
docker compose down || true

echo "Building and starting new container"
docker compose up -d --build

echo "Deployment is successful"
