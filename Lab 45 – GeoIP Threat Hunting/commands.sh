#!/bin/bash

# ==========================================
# Lab 45 - Simple GeoIP Threat Hunting
# ==========================================

# Check Elasticsearch status
curl -k -u elastic:<PASSWORD> https://localhost:9200

# Verify Logstash service
sudo systemctl status logstash

# Verify Elasticsearch service
sudo systemctl status elasticsearch

# Verify Kibana service
sudo systemctl status kibana

# Start Logstash
sudo systemctl start logstash

# Restart Logstash
sudo systemctl restart logstash

# View Logstash logs
sudo journalctl -u logstash -f

# Check indices
curl -k -u elastic:<PASSWORD> https://localhost:9200/_cat/indices?v

# Search GeoIP index
curl -k -u elastic:<PASSWORD> https://localhost:9200/geoip-threat-hunting/_search?pretty

# View index mappings
curl -k -u elastic:<PASSWORD> https://localhost:9200/geoip-threat-hunting/_mapping?pretty

# Count indexed documents
curl -k -u elastic:<PASSWORD> https://localhost:9200/geoip-threat-hunting/_count?pretty

# Check cluster health
curl -k -u elastic:<PASSWORD> https://localhost:9200/_cluster/health?pretty

# ------------------------------------------
# Kibana Navigation (GUI)
# ------------------------------------------
# Analytics -> Maps
# Select index: geoip-threat-hunting
# Plot field: geoip.location