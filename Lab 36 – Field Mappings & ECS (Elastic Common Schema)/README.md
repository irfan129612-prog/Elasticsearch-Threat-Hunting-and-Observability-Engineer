# Lab 36 – Field Mappings & ECS (Elastic Common Schema)

## 📌 Lab Overview

In this lab, we explored **Elastic Common Schema (ECS)** and its importance in standardizing log data within the Elastic Stack.

The purpose of ECS is to provide a consistent field naming structure across different data sources. By mapping custom log fields to ECS fields, security analysts can improve searching, visualization, alerting, and threat detection capabilities.

In this lab, we:

- Reviewed ECS field definitions.
- Mapped custom log fields to ECS equivalents.
- Created an Elasticsearch ingest pipeline.
- Verified ECS-mapped logs in Kibana Security and Observability applications.

---

# 🎯 Objectives

- Understand the importance of Elastic Common Schema.
- Learn how ECS normalizes log data.
- Map custom fields to ECS-compatible fields.
- Create ingest pipelines for data transformation.
- Verify ECS fields in Kibana.

---

# 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| SIEM Platform | Elastic Security |
| Search Engine | Elasticsearch |
| Visualization | Kibana |
| Data Format | JSON Logs |
| Data Processing | Elasticsearch Ingest Pipeline |
| Schema | ECS |

---

# 📚 Introduction to ECS

## What is Elastic Common Schema (ECS)?

Elastic Common Schema is a standardized field naming convention used by Elastic products.

It allows different data sources to use the same field structure.

Example:

Without ECS:

```
client_ip
sourceAddress
ip_address
```

With ECS:

```
source.ip
```

---

## Benefits of ECS

ECS improves:

- Log correlation.
- Security detection rules.
- Dashboard creation.
- Threat hunting.
- Data analysis.

---

# ECS Example Mapping

| Custom Field | ECS Field |
|-------------|-----------|
| ip_address | source.ip |
| user_process | process.name |
| username | user.name |
| hostname | host.name |

---

# Task 1: Review ECS Field Definitions in Kibana

## Access Kibana

Open:

```
http://localhost:5601
```

---

## Navigate to Index Patterns

Go to:

```
Stack Management
        ↓
Index Patterns
```

Review available fields and identify ECS-compatible fields.

---

## Explore ECS Documentation

Important ECS fields include:

### Source IP

```
source.ip
```

Used for:

- Client addresses.
- Network connections.
- Attack source identification.

---

### Process Name

```
process.name
```

Used for:

- Running applications.
- Process monitoring.
- Malware investigation.

---

# Task 2: Map Custom Log Fields to ECS

## Identify Custom Fields

Example custom log:

```json
{
  "ip_address": "192.168.1.1",
  "user_process": "nginx"
}
```

Mapping:

```
ip_address
        ↓
source.ip


user_process
        ↓
process.name
```

---

# Create Elasticsearch Ingest Pipeline

Create pipeline:

```json
PUT _ingest/pipeline/custom_log_pipeline
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
```

---

## Pipeline Explanation

The ingest pipeline processes documents before storing them in Elasticsearch.

The rename processor:

- Reads the original field.
- Converts it into ECS format.
- Stores normalized data.

---

# Task 3: Verify ECS Logs in Kibana

## Index Logs Using Pipeline

Example:

```json
POST /your-index/_doc?pipeline=custom_log_pipeline
{
  "ip_address": "192.168.1.1",
  "user_process": "nginx"
}
```

---

## Verify Data Transformation

Original:

```json
{
 "ip_address": "192.168.1.1",
 "user_process": "nginx"
}
```

After ECS Mapping:

```json
{
 "source": {
   "ip": "192.168.1.1"
 },
 "process": {
   "name": "nginx"
 }
}
```

---

# Verify in Kibana Applications

Navigate to:

## Security

```
Security → Events
```

Check if ECS fields are recognized.

---

## Observability

```
Observability → Logs
```

Verify:

- Correct field names.
- Proper filtering.
- Improved searching capability.

---

# 🔐 SOC Analyst Use Cases

ECS plays an important role in security operations.

## Threat Detection

Normalized fields allow detection rules to work across multiple log sources.

Example:

```
Firewall Logs
      |
Windows Logs
      |
Linux Logs
      |
      ↓
ECS Normalization
      ↓
Detection Rule
```

---

## Threat Hunting

Analysts can search common fields:

Example:

```
source.ip: "192.168.1.1"
```

Instead of searching different field names from every log source.

---

# 🧠 Key Learning Outcomes

After completing this lab:

✅ Learned ECS fundamentals.  
✅ Understood log normalization.  
✅ Mapped custom fields to ECS fields.  
✅ Created Elasticsearch ingest pipelines.  
✅ Verified ECS data in Kibana Security and Observability.  

---

# Conclusion

In this lab, we successfully implemented Elastic Common Schema mapping for custom log data.

ECS improves the consistency of security data by standardizing field names across different sources. This enables better threat detection, easier investigations, and more effective security analytics within Elastic Security.
