#!/bin/bash

# ==========================================
# Lab 41 - Trend Analysis Over Time
# ==========================================

# Check Elasticsearch indices
curl -k -u elastic:<PASSWORD> https://localhost:9200/_cat/indices?v

# Check cluster health
curl -k -u elastic:<PASSWORD> https://localhost:9200/_cluster/health?pretty

# Verify indexed documents
curl -k -u elastic:<PASSWORD> https://localhost:9200/filebeat-*/_count?pretty

curl -k -u elastic:<PASSWORD> https://localhost:9200/metricbeat-*/_count?pretty

curl -k -u elastic:<PASSWORD> https://localhost:9200/packetbeat-*/_count?pretty

# Verify Filebeat service
sudo systemctl status filebeat

# Verify Metricbeat service
sudo systemctl status metricbeat

# Verify Packetbeat service
sudo systemctl status packetbeat

# Verify Elasticsearch
sudo systemctl status elasticsearch

# Verify Kibana
sudo systemctl status kibana

# Restart services if required
sudo systemctl restart elasticsearch
sudo systemctl restart kibana
sudo systemctl restart filebeat
sudo systemctl restart metricbeat
sudo systemctl restart packetbeat