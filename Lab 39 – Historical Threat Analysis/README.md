# 🛡️ Lab 39 – Historical Threat Analysis

## 📖 Overview

This lab demonstrates how to perform **Historical Threat Analysis** using **Elastic Stack** and **Kibana**. Security analysts often investigate historical security logs to identify suspicious activities, reconstruct attack timelines, and understand the behavior of potential threats.

Using **Kibana Discover**, **Event Logs**, and **Timelines**, this lab focuses on analyzing past security events such as malware execution, unauthorized access attempts, suspicious process creation, network anomalies, and possible data exfiltration.

The objective is to build practical threat hunting skills by investigating historical logs and documenting suspicious activities.

---

# 🎯 Objectives

- ✅ Understand historical threat analysis concepts.
- ✅ Investigate historical security events using Kibana Discover.
- ✅ Analyze process creation events.
- ✅ Examine network connection logs.
- ✅ Create investigation timelines.
- ✅ Save searches for future threat hunting.
- ✅ Improve SOC analyst investigation and reporting skills.

---

# 🖥️ Lab Environment

| Component | Details |
|-----------|---------|
| 🛡️ SIEM Platform | Elastic Stack |
| 📊 Visualization Tool | Kibana |
| 🗄️ Data Source | Elasticsearch Logs |
| 🔍 Analysis Tool | Kibana Discover |
| 💬 Query Language | KQL |
| 🎯 Use Case | Historical Threat Hunting |

---

# 📚 Prerequisites

Before starting this lab, ensure you have:

- ✅ Basic cybersecurity knowledge
- ✅ Understanding of Elastic Stack
- ✅ Familiarity with the Kibana interface
- ✅ Access to security event logs
- ✅ Basic Linux command-line knowledge

---

# 🔄 Threat Hunting Workflow

```text
Historical Logs
       │
       ▼
Kibana Discover
       │
       ▼
Event Investigation
       │
       ▼
Suspicious Activity Detection
       │
       ▼
Timeline Creation
       │
       ▼
Threat Report
```

---

# 📝 Lab Tasks

## 🚀 Task 1 – Set Up the Environment

Install and configure the required Elastic Stack components.

### Required Components

- Elasticsearch
- Kibana

### Start Elasticsearch

```bash
bin/elasticsearch
```

### Start Kibana

```bash
bin/kibana
```

Verify that both services are running successfully before continuing.

---

# 📅 Task 2 – Select a Historical Date Range

### Step 1

Open Kibana.

```
http://localhost:5601
```

### Step 2

Navigate to:

```text
Kibana
   └── Discover
```

### Step 3

Use the **Date Picker** to select the desired time range.

Examples:

- 📆 Last Month
- 📅 Custom Date Range

### Purpose

Selecting a historical date range allows analysts to investigate previous security incidents and identify attack patterns over time.

---

# 🔍 Task 3 – Investigate Event Logs

## ⚙️ Process Creation Analysis

Search Query:

```kql
event.action:"process creation"
```

### Purpose

Process creation events record when new processes are executed.

### Threat Indicators

- 🦠 Malware execution
- 📜 Unauthorized scripts
- ⚠️ Suspicious binaries
- 🔒 Persistence mechanisms

---

## 🌐 Network Connection Investigation

Search Query:

```kql
event.category:"network" AND event.action:"connection"
```

### Purpose

Network events help identify suspicious communication between systems.

### Threat Indicators

- 🚫 Unauthorized connections
- 🎯 Command and Control (C2) traffic
- 📤 Data exfiltration attempts
- 🌍 Suspicious external communication

---

# 📋 Task 4 – Summarize Suspicious Activities

## 📌 Create an Investigation Timeline

Navigate to:

```text
Kibana
   └── Timelines
```

Add suspicious events to a Timeline.

### Timeline Benefits

- 🧩 Reconstruct attack sequence
- 🚨 Identify initial compromise
- 🎯 Track Indicators of Compromise (IOCs)
- 👤 Analyze user activities
- 🌐 Review network behavior

---

## 💾 Save the Investigation Search

### Steps

1. Perform a suspicious activity search.
2. Click **Save**.
3. Enter a meaningful search name.

Example:

```text
Historical Malware Investigation
```

### Purpose

Saved searches allow analysts to quickly reuse common threat hunting queries during future investigations.

---

# 🔑 Key Concepts

## 📌 Event Logs

Event logs record important system activities, including:

- 👤 User actions
- ⚙️ Process execution
- 🌐 Network events
- 🚨 Security alerts

---

## 📊 Kibana

Kibana is an open-source visualization and analysis platform used with Elasticsearch for:

- 🔍 Searching logs
- 📈 Creating dashboards
- 🛡️ Investigating security threats
- 📊 Visualizing security data

---

## 🧠 Threat Intelligence

Threat Intelligence provides information about:

- 🚨 Existing threats
- 🎯 Attack techniques
- 🔍 Indicators of Compromise (IOCs)

It helps organizations improve detection and response capabilities.

---

# 🎓 Learning Outcomes

After completing this lab, you will be able to:

- ✅ Perform historical threat investigations.
- ✅ Use Kibana Discover for security log analysis.
- ✅ Investigate process creation events.
- ✅ Analyze network connection activities.
- ✅ Create investigation timelines.
- ✅ Save reusable threat hunting searches.
- ✅ Strengthen SOC analyst investigation skills.

---

# 🌍 Real-World Use Cases

### 🛡️ SOC Investigations

- Analyze historical security incidents
- Identify attacker behavior
- Investigate compromised systems

---

### 🚨 Incident Response

- Reconstruct attack timelines
- Validate security alerts
- Determine attack scope

---

### 📑 Compliance & Auditing

- Review historical security events
- Support forensic investigations
- Maintain audit evidence

---

# 🏁 Conclusion

In this lab, we performed **Historical Threat Analysis** using **Elastic Stack** and **Kibana** by investigating historical security logs, analyzing process creation and network activity events, and creating investigation timelines.

Historical threat hunting enables SOC analysts to uncover hidden threats, understand attacker behavior, reconstruct incidents, and improve future detection and incident response strategies. It is a fundamental skill for modern Security Operations Centers (SOCs) and digital forensics investigations.
