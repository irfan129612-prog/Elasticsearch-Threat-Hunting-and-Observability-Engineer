# Lab 35 – Threat Hunting Using Kibana Visualizations

## 📌 Lab Overview

In this lab, we explored the fundamentals of **Threat Hunting using Kibana Data Visualization**.

The objective was to use Kibana Lens and dashboards to analyze security events, identify abnormal patterns, filter suspicious activities, and create reusable threat hunting dashboards.

Threat hunting focuses on proactively searching through security data to identify potential threats before they become incidents.

---

# 🎯 Objectives

- Understand threat hunting concepts using data visualization.
- Create custom security visualizations in Kibana.
- Analyze security events using filters.
- Identify anomalies and suspicious activity patterns.
- Build a threat hunting dashboard for continuous monitoring.

---

# 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| SIEM Platform | Elastic Stack |
| Search Engine | Elasticsearch |
| Data Processing | Logstash |
| Visualization Tool | Kibana |
| Visualization Feature | Kibana Lens |
| Data Source | Security Logs |

---

# 📚 Introduction to Threat Hunting

## What is Threat Hunting?

Threat Hunting is a proactive cybersecurity approach where analysts search through security data to identify hidden threats.

Instead of waiting for alerts, analysts investigate:

- Suspicious login activity.
- Abnormal network behavior.
- Unusual user actions.
- Potential compromises.

---

## Threat Hunting Workflow

```
Security Logs
      |
      |
Data Visualization
      |
      |
Pattern Analysis
      |
      |
Threat Identification
      |
      |
Investigation & Response
```

---

# Task 1: Setting Up Kibana

## Access Kibana

Open Kibana through a web browser:

```
http://localhost:5601
```

Ensure:

- Elasticsearch is running.
- Logstash is configured.
- Security logs are available.

---

## Load Sample Data (Optional)

If real security data is unavailable:

Navigate to:

```
Home → Sample Data
```

Install available datasets for testing visualizations.

---

# Task 2: Creating a Basic Visualization

## Using Kibana Lens

Navigate to:

```
Analytics → Lens
```

Kibana Lens allows analysts to create visualizations using a drag-and-drop interface.

---

## Select Data Source

Choose an index containing security events.

Examples:

```
firewall logs
authentication logs
network traffic logs
endpoint logs
```

---

## Choose Visualization Type

Available visualization options:

- Bar Chart.
- Line Chart.
- Pie Chart.
- Area Chart.
- Data Table.

---

# Visualize Events by Username or Source IP

## Configure Fields

Example:

X-Axis:

```
username
```

Y-Axis:

```
Count of Events
```

or:

X-Axis:

```
source.ip
```

Y-Axis:

```
Number of Events
```

---

## Apply Security Filters

Example query:

```json
{
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "log.type": "auth"
          }
        }
      ],
      "filter": [
        {
          "range": {
            "@timestamp": {
              "gte": "now-1d/d",
              "lt": "now/d"
            }
          }
        }
      ]
    }
  }
}
```

This query focuses on authentication-related events within the last 24 hours.

---

# Task 3: Detect High Event Counts in Short Intervals

## Select Time Range

Use Kibana time filter:

Example:

```
Last 15 minutes
```

Short time windows help identify:

- Brute-force attacks.
- Login anomalies.
- Sudden activity spikes.

---

## Configure Aggregations

Example:

```yaml
aggs:

  - terms:
      field: "user.keyword"
      size: 10

  - date_histogram:
      field: "@timestamp"
      fixed_interval: "15m"

  - top_hits:
      size: 10
      _source:
        - host
        - event
```

---

# Threat Hunting Examples

## Detect Brute Force Attempts

```
Multiple Failed Logins
          ↓
Same User/IP
          ↓
High Event Count
          ↓
Security Investigation
```

---

## Detect Suspicious Source IP

Analyze:

- Top source IP addresses.
- Login failures.
- Unusual geographic activity.

---

# Task 4: Save Visualizations to Dashboard

## Save Visualization

After creating the visualization:

Click:

```
Save
```

Example name:

```
High Login Attempts
```

---

## Create Threat Hunting Dashboard

Navigate to:

```
Dashboards → Create Dashboard
```

---

## Add Visualization

Add saved visualizations:

Examples:

- Failed Login Analysis.
- Top Source IPs.
- User Activity Monitoring.
- Authentication Trends.

Arrange dashboard panels for better visibility.

---

## Save Dashboard

Example:

```
Threat Hunting Dashboard
```

This dashboard can be reused for continuous monitoring.

---

# 🔐 SOC Analyst Use Cases

Threat hunting dashboards help SOC teams investigate:

## Authentication Attacks

- Brute-force attempts.
- Password spraying.
- Account compromise.

## Network Threats

- Suspicious IP communication.
- Unusual traffic patterns.
- Data exfiltration indicators.

## User Behavior Analysis

- Abnormal login times.
- Privilege misuse.
- Insider threats.

---

# 🧠 Key Learning Outcomes

After completing this lab:

✅ Learned threat hunting fundamentals.  
✅ Created Kibana Lens visualizations.  
✅ Analyzed security events using filters.  
✅ Identified suspicious activity patterns.  
✅ Built a reusable threat hunting dashboard.  

---

# Conclusion

In this lab, we learned how Kibana visualization capabilities support proactive threat hunting.

By creating custom dashboards and analyzing security logs, analysts can identify anomalies, investigate suspicious behavior, and improve threat detection capabilities.

Kibana dashboards provide SOC teams with powerful visibility for continuous security monitoring and investigation.
