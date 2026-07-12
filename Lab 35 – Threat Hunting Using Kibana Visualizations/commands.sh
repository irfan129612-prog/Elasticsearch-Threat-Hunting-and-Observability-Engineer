#!/bin/bash

# Lab 34: Threat Hunting Using Kibana Visualization
# ELK Stack Verification Commands


echo "Checking Elasticsearch Status..."

sudo systemctl status elasticsearch


echo "Checking Logstash Status..."

sudo systemctl status logstash


echo "Checking Kibana Status..."

sudo systemctl status kibana


echo "Testing Elasticsearch Connection..."

curl http://localhost:9200


echo "Checking Elasticsearch Indices..."

curl http://localhost:9200/_cat/indices?v


echo "Checking Kibana Availability..."

curl http://localhost:5601


echo "Threat Hunting Environment Ready"


echo "Open Kibana:"
echo "http://localhost:5601"


echo "Navigate to:"
echo "Analytics → Lens"

echo "Create Dashboard:"
echo "Dashboards → Create Dashboard"