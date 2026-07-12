#!/bin/bash

# Lab 37: Creating a Custom ECS Pipeline
# Elasticsearch ECS Ingest Pipeline Commands


echo "Checking Elasticsearch..."

curl http://localhost:9200


echo "Creating ECS Custom Pipeline..."


curl -X PUT "localhost:9200/_ingest/pipeline/ecs_custom_pipeline" \
-H 'Content-Type: application/json' \
-d '
{
  "description": "A pipeline for converting logs to ECS",
  "processors": [
    {
      "rename": {
        "field": "client_ip",
        "target_field": "client.ip",
        "ignore_failure": true
      }
    },
    {
      "rename": {
        "field": "user_id",
        "target_field": "user.id",
        "ignore_failure": true
      }
    }
  ]
}
'


echo "Testing ECS Pipeline..."


curl -X POST \
"localhost:9200/test-index/_doc?pipeline=ecs_custom_pipeline" \
-H 'Content-Type: application/json' \
-d '
{
  "client_ip": "192.168.1.10",
  "user_id": "admin"
}
'


echo "Checking Indexed Document..."


curl "localhost:9200/test-index/_search?pretty"


echo "ECS Pipeline Lab Completed"

echo "Open Kibana:"
echo "http://localhost:5601"

echo "Verify:"
echo "Discover → client.ip, user.id"
echo "Security → Events"