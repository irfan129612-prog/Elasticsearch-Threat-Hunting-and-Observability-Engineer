#!/bin/bash

# ==============================================
# Lab 39: Historical Threat Analysis
# Elastic Stack Commands
# ==============================================


echo "Starting Historical Threat Analysis Environment"


# ==============================================
# Start Elasticsearch
# ==============================================

echo "Starting Elasticsearch..."

cd elasticsearch/bin

./elasticsearch


# ==============================================
# Start Kibana
# ==============================================

echo "Starting Kibana..."

cd ../../kibana/bin

./kibana



# ==============================================
# Check Running Services
# ==============================================

echo "Checking Elastic Services..."

ps aux | grep elasticsearch

ps aux | grep kibana



# ==============================================
# Check Elasticsearch Status
# ==============================================

echo "Checking Elasticsearch API..."

curl http://localhost:9200



# ==============================================
# List Elasticsearch Indices
# ==============================================

echo "Listing Elasticsearch Indices..."

curl http://localhost:9200/_cat/indices?v



# ==============================================
# Example Threat Hunting Queries
# ==============================================


echo "Process Creation Investigation Query:"

echo 'event.action:"process creation"'


echo "Network Connection Investigation Query:"

echo 'event.category:"network" AND event.action:"connection"'



# ==============================================
# End of Script
# ==============================================

echo "Historical Threat Analysis Lab Setup Completed"