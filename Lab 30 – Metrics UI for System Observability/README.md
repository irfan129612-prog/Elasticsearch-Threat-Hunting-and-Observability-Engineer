# Lab 30 – Metrics UI for System Observability

## 📌 Lab Overview

In this lab, we explored **Metrics UI for System Observability** and learned how monitoring tools help administrators and security teams understand system performance.

The lab focused on analyzing important system metrics including:

- CPU utilization
- Memory usage
- Disk activity
- Host-level performance data

Using observability tools such as **Grafana, Prometheus, and Elastic Observability**, we learned how to visualize metrics, identify performance issues, and analyze individual hosts.

---

# 🎯 Objectives

- Understand the importance of metrics in system observability.
- Learn how to navigate the Metrics UI.
- Monitor CPU, memory, and disk utilization.
- Analyze host-specific performance metrics.
- Identify abnormal resource usage patterns.

---

# 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| Operating System | Linux |
| Monitoring Platform | Grafana / Prometheus |
| Metrics Collection | Node Exporter |
| Visualization | Metrics Dashboard |
| Access Method | Web Browser |

---

# 📚 Introduction to System Observability

System observability provides visibility into the internal state of infrastructure by collecting and analyzing system outputs.

Metrics are one of the three main pillars of observability:

```
Observability
      |
      ├── Logs
      |
      ├── Metrics
      |
      └── APM
```

Metrics help organizations monitor:

- System health.
- Performance issues.
- Resource utilization.
- Availability.

---

# Task 1: Open Metrics UI

## Access Monitoring Dashboard

Open a web browser and access the observability platform.

Example:

```
http://localhost:3000
```

(Grafana default URL)

---

## Login to Dashboard

Use configured credentials.

Default Grafana credentials:

```
Username: admin
Password: admin
```

After first login, change the password for security purposes.

---

# Task 2: Navigate to Metrics Section

## Access Metrics Dashboard

From the observability interface:

```
Observability → Metrics
```

The Metrics UI provides visualization of collected system statistics.

---

## Explore Metrics Panels

Common dashboard panels include:

### CPU Usage

Shows processor utilization over time.

Used to identify:

- High CPU consumption.
- Resource-intensive applications.
- Performance bottlenecks.

---

### Memory Utilization

Displays RAM usage information.

Used to detect:

- Memory exhaustion.
- Memory leaks.
- High application consumption.

---

### Disk Usage

Displays storage activity.

Includes:

- Disk read operations.
- Disk write operations.
- Storage utilization.

---

# Task 3: Monitor CPU, Memory, and Disk Usage

## CPU Monitoring

Analyze CPU graphs and identify:

- Sudden spikes.
- Continuous high utilization.
- Abnormal workload patterns.

Example:

```
High CPU Usage
       ↓
Resource Intensive Process
       ↓
Performance Investigation
```

---

## Memory Monitoring

Monitor memory utilization to identify:

- Low available memory.
- Increasing memory consumption.
- Possible memory leaks.

Example:

```
Continuous Memory Growth
            ↓
Possible Memory Leak
            ↓
Application Analysis
```

---

## Disk Monitoring

Analyze:

- Read operations.
- Write operations.
- Disk performance.

Abnormal disk activity may indicate:

- Heavy application usage.
- Storage issues.
- Unexpected processes.

---

# Task 4: Detailed Metrics by Host

## Select a Host

From the Metrics dashboard:

1. Select a specific host.
2. Open detailed metrics view.
3. Analyze host-level performance.

---

## Analyze Host Metrics

Detailed host metrics include:

- CPU usage.
- Memory consumption.
- Disk activity.
- Network performance.

Look for:

- Unusual spikes.
- Performance degradation.
- Resource bottlenecks.

---

## Example Host Analysis

```
Host Server-01

CPU:
High usage during peak hours

Memory:
Normal utilization

Disk:
Increased write activity

Result:
Investigate workload behavior
```

---

# 🔐 SOC & Security Use Cases

Metrics monitoring helps SOC teams and administrators identify:

## Resource Abuse

Examples:

- Cryptocurrency mining activity.
- Unauthorized processes.
- Server overload.

## Security Investigation

```
Abnormal Resource Usage
          ↓
Metrics Analysis
          ↓
Event Correlation
          ↓
Security Investigation
```

## Infrastructure Monitoring

Used for:

- Server health monitoring.
- Availability tracking.
- Performance optimization.

---

# 🧠 Key Learning Outcomes

After completing this lab:

✅ Learned the role of metrics in observability.  
✅ Navigated Metrics UI dashboards.  
✅ Monitored CPU, memory, and disk usage.  
✅ Analyzed host-level performance data.  
✅ Understood how metrics support troubleshooting and security monitoring.

---

# Conclusion

In this lab, we explored the Metrics UI for system observability and learned how to monitor critical infrastructure resources.

By analyzing CPU, memory, disk, and host-level metrics, administrators can identify performance problems, troubleshoot issues, and maintain reliable systems.

Metrics monitoring is an essential part of modern observability and security operations.
