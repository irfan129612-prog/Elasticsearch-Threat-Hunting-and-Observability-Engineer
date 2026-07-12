#!/bin/bash

# Lab 33: Synthetic Monitoring Basics
# Elastic Heartbeat Setup Commands


echo "Updating system packages..."

sudo apt-get update


echo "Installing Heartbeat..."

sudo apt-get install heartbeat -y


echo "Backing up Heartbeat configuration..."

sudo cp /etc/heartbeat/heartbeat.yml \
/etc/heartbeat/heartbeat.yml.backup


echo "Testing Heartbeat configuration..."

sudo heartbeat \
-e \
-c /etc/heartbeat/heartbeat.yml \
test config


echo "Starting Heartbeat service..."

sudo systemctl start heartbeat


echo "Enabling Heartbeat at boot..."

sudo systemctl enable heartbeat


echo "Checking Heartbeat status..."

sudo systemctl status heartbeat


echo "Synthetic Monitoring Setup Completed"


echo "Kibana URL:"
echo "http://localhost:5601"


echo "Navigate to:"
echo "Observability → Uptime"