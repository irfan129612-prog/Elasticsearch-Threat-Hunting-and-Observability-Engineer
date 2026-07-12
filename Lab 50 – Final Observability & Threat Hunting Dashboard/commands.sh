#!/bin/bash

# ==========================================
# Final Observability & Threat Hunting Dashboard
# ELK + Beats Installation Script
# ==========================================


echo "Updating System Packages..."

sudo apt update -y


# ==========================================
# Install Filebeat
# ==========================================

echo "Installing Filebeat..."

sudo apt install filebeat -y

echo "Enabling Filebeat..."

sudo systemctl enable filebeat

sudo systemctl start filebeat



# ==========================================
# Configure Filebeat
# ==========================================

echo "Testing Filebeat Configuration..."

sudo filebeat test config



# ==========================================
# Install Metricbeat
# ==========================================

echo "Installing Metricbeat..."

sudo apt install metricbeat -y


echo "Enabling Metricbeat System Module..."

sudo metricbeat modules enable system


echo "Setting up Metricbeat..."

sudo metricbeat setup


sudo systemctl enable metricbeat

sudo systemctl start metricbeat



# ==========================================
# Install Packetbeat
# ==========================================

echo "Installing Packetbeat..."

sudo apt install packetbeat -y


echo "Setting up Packetbeat..."

sudo packetbeat setup


sudo systemctl enable packetbeat

sudo systemctl start packetbeat



# ==========================================
# Install Elasticsearch
# ==========================================

echo "Installing Elasticsearch..."

sudo apt install elasticsearch -y


echo "Starting Elasticsearch Service..."

sudo systemctl enable elasticsearch

sudo systemctl start elasticsearch



# ==========================================
# Install Logstash
# ==========================================

echo "Installing Logstash..."

sudo apt install logstash -y


echo "Starting Logstash Service..."

sudo systemctl enable logstash

sudo systemctl start logstash



# ==========================================
# Install Kibana
# ==========================================

echo "Installing Kibana..."

sudo apt install kibana -y


echo "Starting Kibana Service..."

sudo systemctl enable kibana

sudo systemctl start kibana



# ==========================================
# Verify Services
# ==========================================

echo "Checking Elasticsearch..."

systemctl status elasticsearch --no-pager


echo "Checking Logstash..."

systemctl status logstash --no-pager


echo "Checking Kibana..."

systemctl status kibana --no-pager


echo "Checking Filebeat..."

systemctl status filebeat --no-pager


echo "Checking Metricbeat..."

systemctl status metricbeat --no-pager


echo "Checking Packetbeat..."

systemctl status packetbeat --no-pager



# ==========================================
# Elasticsearch Test
# ==========================================

echo "Testing Elasticsearch Connection..."

curl localhost:9200



# ==========================================
# Check Indices
# ==========================================

echo "Checking Elasticsearch Indices..."

curl localhost:9200/_cat/indices?v



echo "=========================================="
echo "Final Observability Dashboard Setup Completed"
echo "=========================================="