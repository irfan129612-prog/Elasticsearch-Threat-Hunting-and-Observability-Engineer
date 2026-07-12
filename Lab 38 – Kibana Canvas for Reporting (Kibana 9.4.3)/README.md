# 🖼️ Lab 38 – Kibana Canvas for Reporting (Elastic Stack 9.4.3)

## 📖 Overview

This lab demonstrates how to use **Kibana Canvas** in **Elastic Stack 9.4.3** to build interactive and professional security reporting dashboards. Kibana Canvas enables analysts to combine live Elasticsearch data with visual components such as metrics, charts, text, shapes, images, and tables to create customized reports for Security Operations Centers (SOC), executive presentations, and compliance reporting.

The objective of this lab is to create a **Security Observability Live Report** that presents real-time security and observability data in an easy-to-understand format.

---

# 🎯 Objectives

- ✅ Understand the purpose and features of Kibana Canvas.
- ✅ Create a new Canvas Workpad.
- ✅ Connect Canvas to Elasticsearch Data Views.
- ✅ Visualize security and observability data.
- ✅ Build reports using metrics, charts, text, and shapes.
- ✅ Design a SOC-style security monitoring dashboard.
- ✅ Learn practical reporting use cases for security operations.

---

# 🖥️ Lab Environment

| Component | Details |
|-----------|---------|
| ⚙️ Elastic Stack Version | 9.4.3 |
| 📊 Visualization Tool | Kibana Canvas |
| 🗄️ Data Source | Elasticsearch |
| 🔍 Query Language | KQL / Elasticsearch Query |
| 🎯 Use Case | Security Reporting |

---

# 🎨 What is Kibana Canvas?

**Kibana Canvas** is a presentation and reporting feature within Kibana that allows users to create fully customized dashboards using live Elasticsearch data.

Unlike standard Kibana dashboards, Canvas provides complete control over layout and design, making it suitable for professional reporting and executive presentations.

## ✨ Key Features

- 📡 Live Elasticsearch data integration
- 🎨 Custom layouts and branding
- 📈 Interactive visualizations
- ⚡ Real-time reporting
- 🖥️ Presentation-ready dashboards
- 📊 Flexible design using charts, metrics, images, and text

---

# 🔄 Reporting Workflow

```text
Elasticsearch Data
        │
        ▼
    Data View
        │
        ▼
   Kibana Canvas
        │
        ▼
Charts • Metrics • Text • Shapes
        │
        ▼
Security Observability Report
```

---

# 📝 Lab Tasks

## 🚀 Task 1 – Open Kibana Canvas

### Step 1

Open Kibana.

```
http://localhost:5601
```

### Step 2

🔐 Log in using your Kibana credentials.

### Step 3

Navigate to:

```
Analytics
   └── Canvas
```

or

```
☰ Menu
   └── Canvas
```

### Step 4

Click:

```
Create Workpad
```

### Step 5

Create a new workpad.

Example:

```
Security Observability Live Report
```

A blank Canvas workspace will open.

---

# 🔗 Task 2 – Configure the Data Source

## 📂 Create a Data View

Navigate to:

```
Stack Management
      └── Data Views
```

Create a Data View if one does not already exist.

Example index patterns:

```
security-*
logs-*
filebeat-*
```

Timestamp Field:

```
@timestamp
```

Save the Data View.

---

## ➕ Add Canvas Elements

Inside the Canvas Workpad, click:

```
Add Element
```

Available Elements:

- 📝 Markdown
- 📊 Metric
- 📈 Chart
- 🔷 Shape
- 🖼️ Image
- 📋 Data Table

---

## 🔌 Connect the Data Source

Select:

```
Add Element
      └── Data
```

Choose your Data View.

Example:

```
security-*
```

Verify that Elasticsearch data loads successfully.

---

# 📊 Task 3 – Create a Security Live Report

## 🏷️ Report Header

Add a Markdown element containing:

```markdown
# Security Observability Live Report

## Elastic Security Monitoring Dashboard

Report Generated:
{{date}}
```

---

## 📌 Security Metrics

### 📈 Total Security Events

**Element**

- Metric

**Aggregation**

- Count of Documents

**Purpose**

Displays the total number of security events.

---

### 🔐 Failed Login Attempts

**Query**

```kql
event.action:"login_failed"
```

**Purpose**

Displays failed authentication attempts.

---

### 💻 Active Hosts

**Field**

```
host.name
```

**Aggregation**

```
Unique Count
```

**Purpose**

Shows the number of monitored hosts.

---

# 📉 Task 4 – Create Visualizations

## 👤 Top Users

**Chart Type**

📊 Bar Chart

Configuration:

- Field: `user.name`
- Aggregation: Count

Purpose:

Identify users generating the highest number of security events.

---

## 📈 Security Events Timeline

**Chart Type**

📈 Line Chart

Configuration:

- Time Field: `@timestamp`
- Aggregation: Date Histogram
- Metric: Count

Purpose:

Analyze security events over time.

---

## 🥧 Event Distribution

**Chart Type**

🥧 Pie Chart

Configuration:

- Field: `event.category`
- Aggregation: Terms

Purpose:

Display the distribution of security event categories.

---

# 🔍 Example Elasticsearch Reporting Query

```sql
SELECT
DateHistogram(field='@timestamp', interval='1d') AS Event_Date,
COUNT(*) AS Events
FROM "security-*"
```

---

# 🎨 Task 5 – Customize the Layout

Canvas allows dashboards to be customized using:

- 🔷 Shapes
- 📝 Text
- 🖼️ Images
- 📊 Charts
- 📈 Metrics

Example SOC Dashboard Layout:

```text
--------------------------------------------------

🛡️ Security Observability Report

--------------------------------------------------

📈 Total Events      🔐 Failed Login

--------------------------------------------------

📊 Security Events Timeline

--------------------------------------------------

👤 Top Users Chart

--------------------------------------------------
```

---

# 💾 Task 6 – Save the Workpad

Click:

```
Save
```

Example Workpad Name:

```
SOC Security Monitoring Report
```

---

# 🛡️ Security Reporting Use Cases

## 🚨 SOC Daily Monitoring

Monitor:

- 🔔 Security alerts
- 🔐 Failed login attempts
- ⚠️ Threat activity
- 👥 User behavior

---

## 📊 Executive Dashboards

Present:

- 🛡️ Security posture
- 📈 Risk metrics
- 🚨 Incident trends
- 📋 Monitoring overview

---

## 📑 Compliance Reporting

Generate evidence for:

- ✅ ISO 27001
- 📝 Security audits
- 📂 Monitoring documentation
- 📊 Compliance reports

---

# 🎓 Key Learning Outcomes

After completing this lab, you will be able to:

- ✅ Navigate Kibana Canvas.
- ✅ Create a Canvas Workpad.
- ✅ Connect Elasticsearch Data Views.
- ✅ Visualize live security data.
- ✅ Build charts, metrics, and interactive reports.
- ✅ Design a SOC-style monitoring dashboard.
- ✅ Understand real-world security reporting workflows.

---

# 📚 Conclusion

In this lab, a **Security Observability Live Report** was created using **Kibana Canvas** in **Elastic Stack 9.4.3**.

By integrating live Elasticsearch data with customizable visual elements, Kibana Canvas provides a powerful platform for building professional security dashboards and reports.

### 🚀 Kibana Canvas is commonly used for:

- 🛡️ SOC Monitoring Dashboards
- 📊 Security Reporting
- 👨‍💼 Executive Presentations
- 📑 Compliance Documentation
- 📡 Operational Observability

It enables security teams to transform Elasticsearch data into clear, interactive, and presentation-ready reports for effective decision-making.
