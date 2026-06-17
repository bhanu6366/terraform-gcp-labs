#!/bin/bash

apt-get update
apt-get install -y docker.io

systemctl enable docker
systemctl start docker

docker run -d \
  --name nginx \
  -p 80:80 \
  nginx:latest
