#!/bin/bash

# ==========================================
# Lab 47: Maintaining Elasticsearch Performance
# ==========================================

# -------------------------------
# Check Cluster Health
# -------------------------------
GET /_cluster/health

# -------------------------------
# View Cluster Nodes
# -------------------------------
GET /_cat/nodes?v

# -------------------------------
# View Indices
# -------------------------------
GET /_cat/indices?v

# -------------------------------
# JVM Heap Statistics
# -------------------------------
GET /_nodes/stats/jvm

# -------------------------------
# Operating System / CPU Statistics
# -------------------------------
GET /_nodes/stats/os

# -------------------------------
# Create ILM Policy
# -------------------------------
PUT _ilm/policy/hot-delete-policy
{
  "policy": {
    "phases": {
      "hot": {
        "actions": {
          "rollover": {
            "max_size": "50gb",
            "max_age": "30d"
          }
        }
      },
      "delete": {
        "min_age": "90d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}

# -------------------------------
# Create Index with ILM Policy
# -------------------------------
PUT logs-000001
{
  "aliases": {
    "logs": {
      "is_write_index": true
    }
  },
  "settings": {
    "index.lifecycle.name": "hot-delete-policy",
    "index.lifecycle.rollover_alias": "logs"
  }
}

# -------------------------------
# Check ILM Policies
# -------------------------------
GET _ilm/policy

# -------------------------------
# Explain ILM Status
# -------------------------------
GET logs-000001/_ilm/explain

# -------------------------------
# Execute Index Rollover
# -------------------------------
POST /logs/_rollover

# -------------------------------
# Verify Cluster Health Again
# -------------------------------
GET /_cluster/health

# -------------------------------
# Verify Indices
# -------------------------------
GET /_cat/indices?v