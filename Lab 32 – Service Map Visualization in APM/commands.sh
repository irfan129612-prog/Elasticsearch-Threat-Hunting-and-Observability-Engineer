#!/bin/bash

# Lab 32: Service Map Visualization in APM
# Jaeger Distributed Tracing Setup


echo "Updating system packages..."

sudo apt-get update


echo "Installing Docker..."

sudo apt-get install docker.io -y


echo "Starting Docker service..."

sudo systemctl start docker
sudo systemctl enable docker


echo "Running Jaeger All-In-One container..."


docker run -d \
--name jaeger \
-e COLLECTOR_ZIPKIN_HTTP_PORT=9411 \
-p 5775:5775/udp \
-p 6831:6831/udp \
-p 6832:6832/udp \
-p 5778:5778 \
-p 16686:16686 \
-p 14268:14268 \
-p 14250:14250 \
-p 9411:9411 \
jaegertracing/all-in-one:1.21


echo "Checking Jaeger container..."

docker ps


echo "Jaeger UI:"
echo "http://localhost:16686"


echo "Service Map APM Lab Setup Completed"