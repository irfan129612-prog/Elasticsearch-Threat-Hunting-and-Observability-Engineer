# Lab 34 – Tracing with Distributed Traces

## 📌 Lab Overview

In this lab, we explored **Distributed Tracing using Application Performance Monitoring (APM)**.

Distributed tracing helps monitor requests as they travel across multiple services in a microservices architecture. It provides visibility into service communication, latency, errors, and performance bottlenecks.

In this lab, we:

- Created connected microservices.
- Integrated OpenTelemetry APM agents.
- Generated distributed transactions.
- Visualized traces using Jaeger.
- Analyzed service performance.

---

# 🎯 Objectives

- Understand distributed tracing concepts.
- Implement APM in microservices.
- Configure OpenTelemetry agents.
- Track end-to-end transactions.
- Visualize traces using open-source tools.
- Identify latency and service bottlenecks.

---

# 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| Architecture | Microservices |
| APM Framework | OpenTelemetry |
| Visualization Tool | Jaeger |
| Container Platform | Docker |
| Language | Python |
| Communication | HTTP |

---

# 📚 Introduction to Distributed Tracing

## What is Distributed Tracing?

Distributed tracing is an observability technique used to follow a request as it moves through multiple services.

Example:

```
User Request
      |
      |
Service A
      |
      |
Service B
      |
      |
Database
```

A trace contains multiple spans:

```
Trace
 |
 ├── Service A Span
 |
 └── Service B Span
```

---

# Why Distributed Tracing?

It helps identify:

- Slow services.
- High latency.
- Failed requests.
- Service dependencies.
- Performance bottlenecks.

---

# Task 1: Setup Connected Services

## Clone Example Repository

Clone microservices project:

```bash
git clone https://github.com/example/distributed-tracing-lab
```

Move into project directory:

```bash
cd distributed-tracing-lab
```

---

## Run Services Using Docker

Start microservices:

```bash
docker-compose up --build
```

This launches:

```
Service A
     |
     |
Service B
```

---

# Task 2: Integrate APM Agents

## Install OpenTelemetry Agent

OpenTelemetry provides:

- Instrumentation.
- Trace collection.
- Export capabilities.

---

# Service A Configuration

Dockerfile:

```dockerfile
FROM python:3.8-slim

RUN pip install \
opentelemetry-api \
opentelemetry-sdk \
opentelemetry-instrumentation

COPY . /app

WORKDIR /app

ENTRYPOINT [
"opentelemetry-instrument",
"python",
"service_a.py"
]
```

---

# Service B Configuration

Dockerfile:

```dockerfile
FROM python:3.8-slim

RUN pip install \
opentelemetry-api \
opentelemetry-sdk \
opentelemetry-instrumentation

COPY . /app

WORKDIR /app

ENTRYPOINT [
"opentelemetry-instrument",
"python",
"service_b.py"
]
```

---

# Rebuild Containers

Stop services:

```bash
docker-compose down
```

Rebuild:

```bash
docker-compose up --build
```

---

# Task 3: Generate Distributed Transaction

Send request to Service A:

```bash
curl http://localhost:PORT/api/trigger
```

Service flow:

```
Client
 |
 |
Service A
 |
 |
Service B
```

The complete request path is captured as a distributed trace.

---

# Task 4: Visualize Traces Using Jaeger

## Start Jaeger

Add Jaeger service in docker-compose:

```yaml
jaeger:

 image: jaegertracing/all-in-one:latest

 ports:

  - "6831:6831/udp"

  - "16686:16686"
```

---

## Access Jaeger UI

Open:

```
http://localhost:16686
```

---

# Analyze Traces

In Jaeger:

```
Select Service
        |
        |
Find Traces
```

Review:

- Request duration.
- Service communication.
- Span details.
- Latency.

Example:

```
Trace ID: abc123

Service A
  |
  | 200ms
  |
Service B
  |
  | 100ms
```

---

# 🔐 SOC & Security Use Cases

Distributed tracing can help security teams investigate:

## Suspicious Service Communication

Example:

```
Compromised Service
          |
          |
Unexpected API Call
          |
          |
Investigation
```

---

## Incident Investigation

Tracing helps identify:

- Attack paths.
- Abnormal service behavior.
- Unauthorized communication.

---

# 🧠 Key Learning Outcomes

After completing this lab:

✅ Learned distributed tracing concepts.  
✅ Configured OpenTelemetry agents.  
✅ Monitored microservice communication.  
✅ Generated end-to-end transactions.  
✅ Visualized traces using Jaeger.  
✅ Understood service latency analysis.

---

# Conclusion

In this lab, we implemented distributed tracing using OpenTelemetry and Jaeger.

Distributed tracing provides deep visibility into modern microservices environments by tracking requests across multiple services.

This capability helps developers, DevOps engineers, and security teams identify performance issues, troubleshoot failures, and understand complex application behavior.
