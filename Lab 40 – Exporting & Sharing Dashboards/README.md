# 📊 Lab 40 – Exporting & Sharing Dashboards

## 📖 Overview

This lab demonstrates how to export and securely share dashboards using popular open-source dashboard platforms such as **Grafana**, **Metabase**, and **Kibana**.

Dashboard sharing is an essential skill for SOC analysts, system administrators, and reporting teams because it enables monitoring data to be distributed securely while protecting dashboards from unauthorized modifications.

In this lab, you will learn how to export dashboards as **PDF** and **CSV**, generate secure sharing links, configure **read-only permissions**, and verify dashboard accessibility.

---

# 🎯 Objectives

- ✅ Export dashboards in multiple formats.
- ✅ Export dashboard reports as PDF.
- ✅ Export dashboard data as CSV.
- ✅ Generate dashboard sharing links.
- ✅ Configure user permissions.
- ✅ Provide read-only dashboard access.
- ✅ Verify dashboard security and access settings.

---

# 🖥️ Lab Environment

| Component | Details |
|-----------|---------|
| 📊 Dashboard Platform | Grafana / Metabase / Kibana |
| 📄 Export Formats | PDF, CSV |
| 🔐 Access Control | User Permissions |
| 👥 Sharing Type | Read-Only Access |
| 🎯 Use Case | Dashboard Reporting |

---

# 📚 Prerequisites

Before starting this lab, ensure you have:

- ✅ Basic operating system navigation skills
- ✅ Familiarity with dashboard platforms
- ✅ An installed open-source dashboard solution

Supported platforms include:

- 📊 Grafana
- 📈 Metabase
- 📉 Kibana

---

# 🔄 Dashboard Sharing Workflow

```text
Dashboard Owner
       │
       ▼
Generate Share Link
       │
       ▼
Configure Permissions
       │
       ▼
Assign Viewer Access
       │
       ▼
Read-Only Dashboard Access
```

---

# 📝 Lab Tasks

## 📤 Task 1 – Export a Dashboard

### 🚀 Step 1.1 – Open a Dashboard

1. Launch your dashboard platform.

Examples:

- Grafana
- Metabase
- Kibana

2. Open the dashboard you want to export.

### Purpose

Select the monitoring dashboard that contains the required visualizations and reports.

---

## 📄 Step 1.2 – Export Dashboard as PDF

### Steps

1. Open the dashboard menu.
2. Click **Export**.
3. Select **PDF** format.
4. Configure export settings:

- 📄 Page Size
- 📐 Orientation
- 🖥️ Layout Options

5. Click **Export**.
6. Save the generated PDF.

### Purpose

PDF export creates professional reports that can be shared offline with management, auditors, or stakeholders.

---

## 📑 Step 1.3 – Export Dashboard Data as CSV

### Steps

1. Open the required data table.
2. Click **Download** or **Export**.
3. Select **CSV** format.
4. Save the exported file.

### Purpose

CSV files can be imported into tools such as:

- 📊 Microsoft Excel
- 🐍 Python
- 📈 Data Analysis Platforms

> **Note:** CSV export availability may depend on the dashboard platform or licensing model.

---

# 🔗 Task 2 – Share a Dashboard

## 🌐 Step 2.1 – Generate a Shareable Link

### Steps

1. Open the dashboard sharing menu.
2. Select:

```
Share Dashboard
```

or

```
Get Link
```

3. Configure sharing settings:

- ⏳ Link expiration
- 🔐 Access restrictions
- 👥 User visibility

4. Copy the generated link.

### Purpose

Allows authorized users to securely access dashboards remotely.

---

## 🔒 Step 2.2 – Configure Read-Only Permissions

### Steps

1. Open:

```
Permissions
```

or

```
Access Control
```

2. Add the required user or group.

3. Assign one of the following roles:

- 👁️ Viewer
- 📖 Read-Only

4. Save the permission changes.

### Purpose

Restricts users from modifying dashboards while allowing them to view monitoring information.

---

# ✅ Task 3 – Verify Dashboard Permissions

## 🧪 Step 3.1 – Test Dashboard Access

### Steps

1. Open a new browser window.
2. Launch **Incognito/Private Mode**.
3. Paste the shared dashboard link.
4. Verify that the dashboard opens successfully.

### Purpose

Ensures that sharing settings have been configured correctly.

---

## 🛡️ Step 3.2 – Confirm Read-Only Access

Attempt the following actions:

- ✏️ Edit dashboard panels
- 📊 Modify charts
- ⚙️ Change dashboard settings

### Expected Result

- ❌ Editing is not permitted.
- ✅ Dashboard remains viewable in read-only mode.

---

# 🔐 Dashboard Sharing Security Model

```text
Dashboard Owner
       │
       ▼
Generate Share Link
       │
       ▼
Configure Permissions
       │
       ▼
Assign Viewer Access
       │
       ▼
Secure Read-Only Dashboard
```

---

# 📚 Key Concepts

## 📄 Dashboard Export

Dashboard export converts visualizations into portable formats for reporting.

Common export formats include:

- 📄 PDF Reports
- 📑 CSV Data Files

---

## 🌐 Dashboard Sharing

Dashboard sharing enables multiple users to securely access monitoring information using:

- 🔗 Shared URLs
- 👤 User Accounts
- 👥 User Groups

---

## 🔐 Permissions Management

Permissions determine what actions users can perform.

### 👁️ Viewer

- View dashboards only
- No editing permissions

### ✏️ Editor

- Create dashboards
- Modify panels
- Update dashboard settings

---

# 🛡️ Real-World Security Use Cases

## 🚨 SOC Reporting

- Share security monitoring dashboards with analysts and management.
- Provide daily operational visibility.

---

## 📑 Compliance Reporting

- Export audit reports.
- Share compliance evidence securely.
- Prevent unauthorized modifications.

---

## 🖥️ Operational Monitoring

- Allow IT and DevOps teams to monitor infrastructure.
- Provide secure read-only access for stakeholders.

---

# 🎓 Learning Outcomes

After completing this lab, you will be able to:

- ✅ Export dashboards as PDF reports.
- ✅ Export dashboard data in CSV format.
- ✅ Generate secure dashboard sharing links.
- ✅ Configure Viewer and Read-Only permissions.
- ✅ Verify dashboard access and security settings.
- ✅ Improve reporting and collaboration workflows.
- ✅ Apply secure dashboard sharing best practices.

---

# 🏁 Conclusion

In this lab, we explored how to export and securely share dashboards using open-source dashboard platforms such as **Grafana**, **Metabase**, and **Kibana**.

By exporting dashboards as **PDF** and **CSV**, analysts can create portable reports for presentations, compliance, and offline analysis. Secure sharing through **Viewer** and **Read-Only** permissions ensures that stakeholders can access monitoring data without risking unauthorized changes.

These capabilities are essential for **SOC operations**, **executive reporting**, **compliance audits**, and **collaborative monitoring environments**.
