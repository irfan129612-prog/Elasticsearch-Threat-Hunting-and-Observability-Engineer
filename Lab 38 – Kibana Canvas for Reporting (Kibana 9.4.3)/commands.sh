#!/bin/bash

# Lab 38: Kibana Canvas Reporting
# Kibana 9.4.3 Environment Verification


echo "Checking Elasticsearch..."

curl http://localhost:9200


echo ""
echo "Checking Elasticsearch Indices..."

curl http://localhost:9200/_cat/indices?v


echo ""
echo "Checking Kibana..."

curl http://localhost:5601


echo ""
echo "Opening Kibana URL"

echo "http://localhost:5601"


echo ""
echo "Navigate:"
echo "Analytics → Canvas"


echo ""
echo "Create Data View:"
echo "Stack Management → Data Views"


echo ""
echo "Canvas Reporting Lab Ready"