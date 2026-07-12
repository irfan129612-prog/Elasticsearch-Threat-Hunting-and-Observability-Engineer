#!/bin/bash

# ==========================================
# Lab 42 - Basic Alerting with Elasticsearch Watcher
# ==========================================

# Check Elasticsearch status
curl -k -u elastic:<PASSWORD> https://localhost:9200

# List existing watches
curl -k -u elastic:<PASSWORD> https://localhost:9200/_watcher/stats?pretty

# Create Watch (execute in Kibana Dev Tools)
# PUT _watcher/watch/log_error_watch

# View Watch
curl -k -u elastic:<PASSWORD> https://localhost:9200/_watcher/watch/log_error_watch?pretty

# Insert sample log
curl -k -u elastic:<PASSWORD> -X POST https://localhost:9200/logs/_doc \
-H "Content-Type: application/json" \
-d '{
  "timestamp":"2026-07-12T12:00:00",
  "error":"critical",
  "message":"Critical error detected on server."
}'

# Check logs index
curl -k -u elastic:<PASSWORD> https://localhost:9200/logs/_search?pretty

# View Watch history
curl -k -u elastic:<PASSWORD> https://localhost:9200/.watcher-history*/_search?pretty

# Check Elasticsearch indices
curl -k -u elastic:<PASSWORD> https://localhost:9200/_cat/indices?v

# Verify Elasticsearch service
sudo systemctl status elasticsearch

# Verify Kibana service
sudo systemctl status kibana

# Restart services (if required)
sudo systemctl restart elasticsearch
sudo systemctl restart kibana