#!/bin/bash

echo "Logging into Docker"
# echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker build -t $DOCKER_USERNAME/wtf_repo:be_v1 -f backend/Dockerfile backend
docker build -t $DOCKER_USERNAME/wtf_repo:fe_v1 -f dive-react-app/Dockerfile dive-react-app

docker push $DOCKER_USERNAME/wtf_repo:be_v1
docker push $DOCKER_USERNAME/wtf_repo:fe_v1
