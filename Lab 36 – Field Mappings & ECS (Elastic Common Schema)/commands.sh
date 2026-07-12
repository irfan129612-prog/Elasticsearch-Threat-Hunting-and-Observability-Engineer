#!/bin/bash

# Lab 35: Field Mappings & ECS
# Elasticsearch ECS Mapping Commands


echo "Checking Elasticsearch Status..."

sudo systemctl status elasticsearch


echo "Checking Kibana Status..."

sudo systemctl status kibana


echo "Testing Elasticsearch Connection..."

curl http://localhost:9200


echo "Creating ECS Ingest Pipeline..."


curl -X PUT "localhost:9200/_ingest/pipeline/custom_log_pipeline" \
-H 'Content-Type: application/json' \
-d '
{
  "description": "Pipeline to map custom logs to ECS fields",
  "processors": [
    {
      "rename": {
        "field": "ip_address",
        "target_field": "source.ip"
      }
    },
    {
      "rename": {
        "field": "user_process",
        "target_field": "process.name"
      }
    }
  ]
}
'


echo "Testing ECS Pipeline..."


curl -X POST "localhost:9200/test-index/_doc?pipeline=custom_log_pipeline" \
-H 'Content-Type: application/json' \
-d '
{
  "ip_address": "192.168.1.1",
  "user_process": "nginx"
}
'


echo "Checking Indexed Document..."

curl "localhost:9200/test-index/_search?pretty"


echo "ECS Mapping Lab Completed"

echo "Open Kibana:"
echo "http://localhost:5601"