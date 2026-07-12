# 📦 Lab 48: Handling Large Log Volumes

## 📌 Lab Summary

In this lab, Elasticsearch **Data Streams** were used to efficiently manage high-volume log data. An index template was created, an Index Lifecycle Management (ILM) policy was configured with rollover conditions, and a data stream was created to store timestamped logs. Finally, sample log events were indexed and the rollover status was verified using Kibana Dev Tools.

---

## 🎯 Objectives

- Understand Elasticsearch Data Streams.
- Create an index template for log data.
- Configure an ILM policy with rollover conditions.
- Create a data stream for high-volume logs.
- Insert sample log documents.
- Verify rollover and backing indices.

---

## 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| Elasticsearch | 9.x |
| Kibana | 9.x |
| Operating System | Ubuntu 24.04 LTS |
| Interface | Kibana Dev Tools |
| Feature | Data Streams & ILM |

---

# 📖 Introduction

Large-scale logging environments continuously generate millions of events. Managing these logs using traditional indices becomes inefficient over time.

Elasticsearch Data Streams automatically manage time-series data by creating hidden backing indices and performing rollovers based on ILM policies. This approach improves scalability, simplifies index management, and optimizes search performance.

---

# 📂 Lab Tasks

## Task 1: Create an Index Template

Create an index template for log data.

```http
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
```

The template automatically applies to every `logs-*` data stream.

---

## Task 2: Create an ILM Policy

Configure an Index Lifecycle Management policy.

```http
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
```

The rollover occurs when:

- Index size reaches **5 GB**
- OR index age reaches **1 day**

---

## Task 3: Create the Data Stream

Create a new data stream.

```http
PUT _data_stream/logs
```

Elasticsearch automatically creates the first backing index.

Example:

```
.ds-logs-000001
```

---

## Task 4: Insert Sample Log Data

Index sample log events.

```http
POST logs/_doc
{
  "@timestamp":"2026-07-10T10:00:00",
  "message":"Application started successfully",
  "level":"info"
}
```

Insert another document.

```http
POST logs/_doc
{
  "@timestamp":"2026-07-10T10:05:00",
  "message":"Database connection established",
  "level":"info"
}
```

---

## Task 5: Verify the Data Stream

View available data streams.

```http
GET _data_stream
```

The output displays:

- Data stream name
- Backing indices
- Generation number

---

## Task 6: Verify Backing Indices

Check the backing indices.

```http
GET _cat/indices/.ds-logs-*?v
```

This confirms that Elasticsearch created the hidden backing index.

---

## Task 7: Verify the ILM Policy

View configured lifecycle policies.

```http
GET _ilm/policy
```

---

## Task 8: Check ILM Status

Display lifecycle information.

```http
GET .ds-logs-*/_ilm/explain
```

The response shows:

- Current phase
- Current action
- Rollover eligibility

---

## Task 9: Monitor Data Stream

Display data stream statistics.

```http
GET _data_stream/logs
```

This verifies that documents are stored correctly inside the data stream.

---

# 🔍 Key Concepts

## Data Stream

A specialized Elasticsearch feature designed for managing time-series data such as logs and metrics.

---

## Backing Index

Hidden indices automatically managed by Elasticsearch.

Example:

```
.ds-logs-000001
```

---

## Index Template

Defines mappings, settings, and lifecycle policies that are automatically applied to new indices or data streams.

---

## ILM (Index Lifecycle Management)

Automates index management by moving indices through lifecycle phases.

Common phases include:

- Hot
- Warm
- Cold
- Frozen
- Delete

---

## Rollover

Automatically creates a new backing index when specified conditions are met.

Common rollover conditions include:

- Maximum size
- Maximum age
- Maximum document count

---

# 💡 Benefits of Data Streams

- Efficient management of massive log volumes.
- Automatic rollover of backing indices.
- Simplified lifecycle management.
- Better search performance.
- Reduced administrative overhead.
- Seamless integration with Filebeat, Metricbeat, and Elastic Agent.

---

# 📊 Outcome

After completing this lab, the following skills were achieved:

- Created an Elasticsearch index template.
- Configured an ILM rollover policy.
- Created a Data Stream.
- Indexed sample log data.
- Verified backing indices.
- Monitored rollover and lifecycle status.

---


# ✅ Conclusion

This lab demonstrated how Elasticsearch Data Streams simplify the management of large log volumes. By combining index templates, lifecycle policies, and automatic rollover, Elasticsearch efficiently handles continuous streams of log data while maintaining high performance and scalability. Data Streams are the recommended approach for storing logs, metrics, and other time-series datasets in modern Elastic environments.

---

# 📚 Key Takeaways

- Data Streams simplify time-series data management.
- Backing indices are managed automatically.
- ILM automates rollover and lifecycle operations.
- Index templates ensure consistent mappings and settings.
- Data Streams improve scalability for large logging environments.

---
