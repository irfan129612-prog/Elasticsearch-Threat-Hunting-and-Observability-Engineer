#!/bin/bash

# Lab 29: Centralized Logs View with Logs UI
# Filebeat Installation and Configuration Commands


echo "Updating system packages..."

sudo apt-get update


echo "Installing Filebeat..."

sudo apt-get install filebeat -y


echo "Backing up Filebeat configuration..."

sudo cp /etc/filebeat/filebeat.yml /etc/filebeat/filebeat.yml.backup


echo "Configuring Filebeat..."

sudo tee /etc/filebeat/filebeat.yml > /dev/null <<EOF

filebeat.inputs:
- type: log
  enabled: true
  paths:
    - /var/log/*.log


output.elasticsearch:
  hosts: ["localhost:9200"]

EOF


echo "Testing Filebeat configuration..."

sudo filebeat test config


echo "Starting Filebeat service..."

sudo systemctl start filebeat


echo "Enabling Filebeat on boot..."

sudo systemctl enable filebeat


echo "Checking Filebeat status..."

sudo systemctl status filebeat


echo "Filebeat setup completed."

echo "Kibana Logs UI:"
echo "http://localhost:5601"

echo "Elasticsearch:"
echo "http://localhost:9200"