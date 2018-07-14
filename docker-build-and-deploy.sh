#!/bin/sh

docker build -t remote_detector .
docker tag remote_detector 546045909593.dkr.ecr.us-east-1.amazonaws.com/remote_detector:$1
docker tag remote_detector 546045909593.dkr.ecr.us-east-1.amazonaws.com/remote_detector:latest
sudo docker login -u AWS -p $(aws ecr get-authorization-token --output text --query authorizationData[].authorizationToken | base64 -d | cut -d: -f2) ${ECR_URL}.
$( aws ecr get-login --profile=talon-initiative --region us-east-1 )
docker push 546045909593.dkr.ecr.us-east-1.amazonaws.com/remote_detector:$1
docker push 546045909593.dkr.ecr.us-east-1.amazonaws.com/remote_detector:latest