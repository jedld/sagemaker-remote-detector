#!/bin/sh

docker build -t remote_detector .
docker tag remote_detector 546045909593.dkr.ecr.us-east-1.amazonaws.com/remote_detector:$1
docker tag remote_detector 546045909593.dkr.ecr.us-east-1.amazonaws.com/remote_detector:latest
$( aws ecr get-login  --region us-east-1 )
docker push 546045909593.dkr.ecr.us-east-1.amazonaws.com/remote_detector:$1
docker push 546045909593.dkr.ecr.us-east-1.amazonaws.com/remote_detector:latest