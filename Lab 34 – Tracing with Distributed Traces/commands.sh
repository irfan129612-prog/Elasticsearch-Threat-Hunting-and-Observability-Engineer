#!/bin/bash

# Lab 34: Distributed Tracing with OpenTelemetry and Jaeger


echo "Checking Docker installation..."

docker --version


echo "Checking Docker Compose..."

docker compose version


echo "Cloning Distributed Tracing Lab Repository..."

git clone https://github.com/example/distributed-tracing-lab


cd distributed-tracing-lab


echo "Starting Microservices..."

docker-compose up --build -d


echo "Checking Running Containers..."

docker ps


echo "Stopping Services..."

docker-compose down


echo "Starting Jaeger Container..."

docker run -d \
--name jaeger \
-p 6831:6831/udp \
-p 16686:16686 \
jaegertracing/all-in-one:latest


echo "Checking Jaeger Status..."

docker ps


echo "Jaeger UI:"
echo "http://localhost:16686"


echo "Trigger Test Transaction Example:"
echo "curl http://localhost:<SERVICE_PORT>/api/trigger"


echo "Distributed Tracing Lab Completed"