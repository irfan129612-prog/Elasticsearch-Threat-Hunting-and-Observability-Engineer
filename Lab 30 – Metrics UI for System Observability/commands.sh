#!/bin/bash

# Lab 30: Metrics UI for System Observability
# Prometheus + Node Exporter Setup Commands


echo "Updating system packages..."

sudo apt-get update


echo "Installing Prometheus..."

sudo apt-get install prometheus -y


echo "Starting Prometheus service..."

sudo systemctl start prometheus
sudo systemctl enable prometheus


echo "Installing Node Exporter..."

sudo apt-get install prometheus-node-exporter -y


echo "Starting Node Exporter..."

sudo systemctl start prometheus-node-exporter
sudo systemctl enable prometheus-node-exporter


echo "Checking Prometheus status..."

sudo systemctl status prometheus


echo "Checking Node Exporter status..."

sudo systemctl status prometheus-node-exporter


echo "Testing Node Exporter metrics..."

curl http://localhost:9100/metrics


echo "Metrics Monitoring Setup Completed"


echo "Prometheus Dashboard:"
echo "http://localhost:9090"

echo "Grafana Dashboard:"
echo "http://localhost:3000"