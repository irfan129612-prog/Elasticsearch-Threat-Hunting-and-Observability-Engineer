#!/bin/bash

# Lab 28: Observability Overview Commands

echo "Starting Observability Lab Setup..."

# Update System Packages
sudo apt-get update


# Install Prometheus
sudo apt-get install -y prometheus

# Start Prometheus Service
sudo systemctl start prometheus
sudo systemctl enable prometheus


# Install Elasticsearch
sudo apt-get install -y elasticsearch

# Start Elasticsearch
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch


# Install Kibana
sudo apt-get install -y kibana

# Start Kibana
sudo systemctl start kibana
sudo systemctl enable kibana


# Check Services Status

echo "Checking Elasticsearch Status..."
sudo systemctl status elasticsearch

echo "Checking Kibana Status..."
sudo systemctl status kibana

echo "Checking Prometheus Status..."
sudo systemctl status prometheus


# Jaeger APM Deployment using Docker

docker run -d --name jaeger \
-e COLLECTOR_ZIPKIN_HTTP_PORT=9411 \
-p 5775:5775/udp \
-p 6831:6831/udp \
-p 6832:6832/udp \
-p 5778:5778 \
-p 16686:16686 \
-p 14268:14268 \
-p 14250:14250 \
-p 9411:9411 \
jaegertracing/all-in-one:1.30


echo "Observability tools installation completed."
echo "Prometheus: http://localhost:9090"
echo "Kibana: http://localhost:5601"
echo "Grafana: http://localhost:3000"
echo "Jaeger: http://localhost:16686"