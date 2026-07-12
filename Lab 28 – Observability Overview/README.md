# Lab 28: Observability Overview (Logs, Metrics, APM)

## 📌 Lab Overview

In this lab, we explored the fundamentals of **Observability** in modern IT infrastructure. The lab focused on understanding the three main pillars of observability:

- Logs
- Metrics
- Application Performance Monitoring (APM)

We deployed and explored open-source observability tools including **Elasticsearch, Kibana, Prometheus, Grafana, and Jaeger** to collect, visualize, and analyze system and application data.

Observability helps engineers and security teams understand system behavior, identify performance issues, and troubleshoot problems efficiently.

---

# 🎯 Objectives

- Understand the concept of observability.
- Learn the importance of Logs, Metrics, and APM.
- Explore observability dashboards and interfaces.
- Configure log collection and visualization.
- Monitor system performance using metrics.
- Understand application tracing using APM tools.

---

# 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| Operating System | Linux |
| Log Management | Elasticsearch + Kibana |
| Metrics Monitoring | Prometheus + Grafana |
| Application Monitoring | Jaeger APM |
| Data Collection | Filebeat / Beats |
| Container Platform | Docker |

---

# 📚 Observability Concepts

## What is Observability?

Observability is the ability to understand the internal state of a system by analyzing its external outputs.

The three major components are:

### 1. Logs

Logs provide detailed information about system and application events.

Examples:

- Authentication events
- Application errors
- System activities
- Security events

---

### 2. Metrics

Metrics represent numerical measurements of system performance.

Examples:

- CPU usage
- Memory utilization
- Disk usage
- Network traffic

---

### 3. Application Performance Monitoring (APM)

APM helps monitor application behavior and performance.

It provides:

- Distributed tracing
- Transaction monitoring
- Application error detection
- Service dependency analysis

---

# Task 1: Observability Platform Setup

## Install Prometheus

Prometheus is an open-source monitoring system used for collecting and querying metrics.

Installation:

```bash
sudo apt-get update
sudo apt-get install prometheus
```

Start service:

```bash
sudo systemctl start prometheus
sudo systemctl enable prometheus
```

Access Prometheus:

```
http://localhost:9090
```

---

## Grafana Visualization

Grafana is used to visualize metrics collected from monitoring systems.

Default access:

```
http://localhost:3000
```

Grafana dashboards can display:

- Infrastructure health
- Application metrics
- Resource utilization

---

# Task 2: Explore Logs UI

## Install Elasticsearch

Elasticsearch is used for storing and searching log data.

Installation:

```bash
sudo apt-get install elasticsearch
```

Start service:

```bash
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch
```

---

## Install Kibana

Kibana provides visualization and analysis capabilities for Elasticsearch data.

Installation:

```bash
sudo apt-get install kibana
```

Start service:

```bash
sudo systemctl start kibana
sudo systemctl enable kibana
```

Access Kibana:

```
http://localhost:5601
```

---

## Configure Filebeat Log Collection

Filebeat forwards log data to Elasticsearch.

Example configuration:

```yaml
filebeat.inputs:
- type: log
  paths:
    - /var/log/*.log

output.elasticsearch:
  hosts: ["localhost:9200"]
```

Logs can then be visualized in Kibana dashboards.

---

# Task 3: Metrics Monitoring with Prometheus

## Configure Prometheus Targets

Edit configuration:

```bash
/etc/prometheus/prometheus.yml
```

Example configuration:

```yaml
scrape_configs:
  - job_name: 'node'
    static_configs:
      - targets: ['localhost:9100']
```

---

## Query System Metrics

Access Prometheus:

```
http://localhost:9090
```

Use the expression browser to query:

- CPU statistics
- Memory usage
- Network metrics
- System performance data

---

# Optional Task: Application Performance Monitoring (APM)

## Introduction to APM

APM tools monitor application performance and help identify problems in distributed systems.

Common APM capabilities:

- Request tracing
- Performance monitoring
- Error tracking
- Service dependency analysis

---

## Deploy Jaeger APM

Jaeger provides distributed tracing functionality.

Run Jaeger container:

```bash
docker run -d --name jaeger \
-e COLLECTOR_ZIPKIN_HTTP_PORT=9411 \
-p 5775:5775/udp \
-p 6831:6831/udp \
-p 6832:6832/udp \
-p 5778:5778 \
-p 16686:16686 \
-p 14268:14268 \
-p 14250:14250 \
-p 9411:9411 \
jaegertracing/all-in-one:1.30
```

---

## Access Jaeger Dashboard

Open:

```
http://localhost:16686
```

Use Jaeger UI to analyze:

- Application traces
- Service communication
- Request performance

---

# 🔐 SOC & Security Use Cases

Observability plays an important role in Security Operations.

## Log Monitoring

Used for:

- Failed login detection
- Unauthorized access monitoring
- Security event analysis

## Metrics Monitoring

Used for:

- Resource abuse detection
- Server health monitoring
- Performance issues

## APM Monitoring

Used for:

- Application attacks detection
- API performance monitoring
- Service dependency analysis

---

# 🧠 Key Learning Outcomes

After completing this lab:

✅ Learned the fundamentals of observability.  
✅ Understood Logs, Metrics, and APM concepts.  
✅ Installed and explored Prometheus monitoring.  
✅ Configured Elasticsearch and Kibana for logs.  
✅ Learned application tracing using Jaeger.  
✅ Understood how observability supports monitoring and troubleshooting.

---

# Conclusion

In this lab, we explored the complete observability ecosystem using open-source tools.

By combining logs, metrics, and application traces, organizations can gain complete visibility into their infrastructure and applications. Observability improves troubleshooting, system reliability, and security monitoring capabilities.
