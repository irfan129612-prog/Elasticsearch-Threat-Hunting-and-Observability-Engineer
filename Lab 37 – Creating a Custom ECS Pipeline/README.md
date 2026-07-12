# Lab 37 – Creating a Custom ECS Pipeline

## 📌 Lab Overview

In this lab, we created a **custom Elasticsearch ingest pipeline** to normalize log data according to **Elastic Common Schema (ECS)** standards.

ECS provides a consistent structure for event data across Elastic products, making it easier to search, correlate, visualize, and analyze security information.

In this lab, we:

- Created an Elasticsearch ingest pipeline.
- Applied ECS field naming conventions.
- Integrated the pipeline with Filebeat/Logstash.
- Verified ECS fields in Kibana Discover and Security applications.

---

# 🎯 Objectives

- Understand Elasticsearch ingest pipelines.
- Learn ECS field normalization.
- Create custom ECS transformation rules.
- Apply pipelines to Filebeat or Logstash output.
- Verify ECS fields in Kibana.
- Improve security data correlation.

---

# 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| SIEM Platform | Elastic Stack |
| Search Engine | Elasticsearch |
| Visualization | Kibana |
| Data Collector | Filebeat / Logstash |
| Data Standard | Elastic Common Schema (ECS) |
| Configuration | JSON |

---

# 📚 Introduction to ECS Pipeline

## What is an Elasticsearch Ingest Pipeline?

An ingest pipeline is a collection of processors that transform documents before they are stored in Elasticsearch.

Pipeline workflow:

```
Raw Logs
    |
    |
Ingest Pipeline
    |
    |
ECS Normalization
    |
    |
Elasticsearch
    |
    |
Kibana Analysis
```

---

## Why ECS?

Without ECS:

```
client_ip
source_address
remote_ip
```

Different tools may use different field names.

With ECS:

```
client.ip
```

Standardized fields improve:

- Searching.
- Detection rules.
- Dashboards.
- Threat hunting.
- Data correlation.

---

# Task 1: Define an Ingest Pipeline

## Access Kibana Dev Tools

Open Kibana:

```
http://localhost:5601
```

Navigate to:

```
Dev Tools
```

---

## Create ECS Ingest Pipeline

Run the following command:

```json
PUT _ingest/pipeline/ecs_custom_pipeline
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
```

---

## Pipeline Explanation

### Ingest Pipeline

A process that modifies documents before indexing.

### Processors

Processors perform transformations.

In this lab:

```
client_ip
      |
      ↓
client.ip


user_id
      |
      ↓
user.id
```

---

# Task 2: Apply Pipeline to Filebeat or Logstash

## Configure Filebeat

Edit:

```bash
/etc/filebeat/filebeat.yml
```

Add pipeline configuration:

```yaml
output.elasticsearch:
  hosts: ["http://localhost:9200"]
  pipeline: "ecs_custom_pipeline"
```

Now Filebeat logs will automatically pass through the ECS pipeline.

---

# Configure Logstash

Example Elasticsearch output:

```ruby
output {

  elasticsearch {

    hosts => ["localhost:9200"]

    pipeline => "ecs_custom_pipeline"

  }

}
```

---

## Pipeline Data Flow

```
Filebeat / Logstash
          |
          |
ecs_custom_pipeline
          |
          |
ECS Fields Created
          |
          |
Elasticsearch Index
```

---

# Task 3: Verify ECS Fields in Kibana

## Verify in Discover

Navigate:

```
Kibana → Discover
```

Search indexed documents.

Verify fields:

```
client.ip
user.id
```

Example:

Before:

```json
{
 "client_ip": "192.168.1.10",
 "user_id": "admin"
}
```

After ECS Pipeline:

```json
{
 "client": {
   "ip": "192.168.1.10"
 },
 "user": {
   "id": "admin"
 }
}
```

---

# Verify in Security Application

Navigate:

```
Security → Events
```

Confirm ECS fields are available for:

- Event correlation.
- Detection rules.
- Investigation.
- Threat hunting.

---

# 🔐 SOC Analyst Use Cases

Custom ECS pipelines help SOC teams normalize data from different sources.

## Security Data Correlation

Example:

```
Firewall Logs
       |
Linux Logs
       |
Windows Logs
       |
       ↓
ECS Normalization
       ↓
Detection Rule
       ↓
Security Alert
```

---

## Threat Hunting

Analysts can search common fields:

Example:

```
client.ip: "192.168.1.10"
```

without knowing the original field name used by the log source.

---

# 🧠 Key Learning Outcomes

After completing this lab:

✅ Learned Elasticsearch ingest pipelines.  
✅ Created a custom ECS transformation pipeline.  
✅ Applied ECS naming conventions.  
✅ Integrated pipeline with Filebeat/Logstash.  
✅ Verified ECS fields in Kibana.  
✅ Improved log normalization skills.

---

# Conclusion

In this lab, we successfully created a custom ECS ingest pipeline in Elasticsearch.

By standardizing log fields using ECS naming conventions, organizations can improve security analytics, simplify threat hunting, and enhance correlation between multiple data sources.

ECS pipelines are an essential skill for SIEM engineers, SOC analysts, and detection engineers working with Elastic Security.
