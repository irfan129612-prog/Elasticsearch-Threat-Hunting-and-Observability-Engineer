#!/bin/bash

# ==========================================
# Lab 48: Handling Large Log Volumes
# ==========================================

# -------------------------------
# Create ILM Policy
# -------------------------------
PUT _ilm/policy/logs-policy
{
  "policy": {
    "phases": {
      "hot": {
        "actions": {
          "rollover": {
            "max_size": "5gb",
            "max_age": "1d"
          }
        }
      }
    }
  }
}

# -------------------------------
# Create Index Template
# -------------------------------
PUT _index_template/logs-template
{
  "index_patterns": ["logs-*"],
  "template": {
    "settings": {
      "number_of_shards": 1,
      "index.lifecycle.name": "logs-policy"
    },
    "mappings": {
      "properties": {
        "@timestamp": {
          "type": "date"
        },
        "message": {
          "type": "text"
        },
        "level": {
          "type": "keyword"
        }
      }
    }
  },
  "data_stream": {}
}

# -------------------------------
# Create Data Stream
# -------------------------------
PUT _data_stream/logs

# -------------------------------
# Insert Sample Log Document
# -------------------------------
POST logs/_doc
{
  "@timestamp":"2026-07-10T10:00:00",
  "message":"Application started successfully",
  "level":"info"
}

# -------------------------------
# Insert Another Log
# -------------------------------
POST logs/_doc
{
  "@timestamp":"2026-07-10T10:05:00",
  "message":"Database connection established",
  "level":"info"
}

# -------------------------------
# View Data Streams
# -------------------------------
GET _data_stream

# -------------------------------
# View Specific Data Stream
# -------------------------------
GET _data_stream/logs

# -------------------------------
# View Backing Indices
# -------------------------------
GET _cat/indices/.ds-logs-*?v

# -------------------------------
# View ILM Policies
# -------------------------------
GET _ilm/policy

# -------------------------------
# Explain ILM Status
# -------------------------------
GET .ds-logs-*/_ilm/explain