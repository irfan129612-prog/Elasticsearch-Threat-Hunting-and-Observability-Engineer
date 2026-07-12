# Lab 32 – Service Map Visualization in APM

## 📌 Lab Overview

In this lab, we explored **Service Map Visualization in Application Performance Monitoring (APM)**.

The Service Map provides a visual representation of how different application services communicate with each other. It helps engineers and security teams understand service dependencies, identify performance bottlenecks, and troubleshoot distributed applications.

In this exercise, we used APM visualization to:

- Access Service Map.
- Analyze service dependencies.
- Review service performance metrics.
- Understand distributed tracing.

---

# 🎯 Objectives

- Understand the purpose of Service Map in APM.
- Access and navigate Service Map visualization.
- Identify dependencies between application services.
- Analyze service performance metrics.
- Detect potential bottlenecks using APM data.

---

# 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| Monitoring Platform | APM |
| Tracing Tool | Jaeger / Zipkin |
| Visualization | Service Map |
| Application Type | Microservices |
| Container Platform | Docker |

---

# 📚 Introduction to Service Map

## What is Service Map?

Service Map is an APM feature that provides a graphical representation of application architecture.

It shows:

- Services.
- Dependencies.
- Communication paths.
- Performance metrics.

---

## Service Map Architecture

```
Service A
    |
    |
Service B
    |
    |
Service C

        ↓

APM Agent
        ↓
APM Server
        ↓
Visualization Dashboard
```

---

# Task 1: Open Service Map in APM

## Access APM Interface

Open the APM dashboard in a browser.

Example Jaeger URL:

```
http://localhost:16686
```

Login using configured credentials.

---

## Navigate to Service Map

From the APM interface:

```
Dashboard → Service Map
```

The Service Map displays application services as nodes.

Connections between nodes represent communication and dependencies.

---

# Task 2: Identify Service Dependencies

## Select Test Service

Locate the target service inside the Service Map.

Example:

```
frontend-service
```

---

## Analyze Dependencies

Observe connections between services.

These connections represent:

- API calls.
- Request flow.
- Service communication.

Example:

```
Frontend Service
        |
        |
Backend API
        |
        |
Database Service
```

---

## Highlight Dependency Paths

Use Service Map features to:

- Follow request paths.
- Identify important dependencies.
- Analyze service relationships.

This helps identify where failures or delays occur.

---

# Task 3: Analyze Service Performance Metrics

## Access Service Metrics

Click on any service node inside the Service Map.

Review available metrics:

---

## Response Time

Measures how long services take to process requests.

High response time may indicate:

- Slow application logic.
- Database delays.
- Resource limitations.

---

## Request Rate

Shows the number of requests received by a service.

Useful for identifying:

- Traffic spikes.
- Increased workload.
- Abnormal activity.

---

## Error Rate

Shows failed requests and application errors.

High error rates may indicate:

- Application failures.
- Service communication problems.
- Configuration issues.

---

# Jaeger Deployment

Run Jaeger using Docker:

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
jaegertracing/all-in-one:1.21
```

---

# Enable Application Tracing

Example Python tracing configuration:

```python
from flask import Flask
from jaeger_client import Config


def initialize_tracer():
    config = Config(
        config={
            'sampler': {
                'type': 'const',
                'param': 1
            }
        },
        service_name='your-test-service',
        validate=True,
    )

    return config.initialize_tracer()


app = Flask(__name__)

tracer = initialize_tracer()


@app.route('/')
def homepage():

    with tracer.start_span('homepage') as span:
        return "Welcome to the homepage!"
```

---

# 🔐 SOC & Security Use Cases

Service Map visualization helps security teams understand application behavior.

## Threat Investigation

Example:

```
Suspicious Request
        ↓
Affected Service
        ↓
Dependency Analysis
        ↓
Incident Investigation
```

---

## Common Use Cases

- Detect abnormal service communication.
- Identify compromised services.
- Investigate application attacks.
- Monitor API dependencies.
- Analyze distributed application failures.

---

# 🧠 Key Learning Outcomes

After completing this lab:

✅ Learned how Service Map works in APM.  
✅ Visualized application dependencies.  
✅ Analyzed service communication paths.  
✅ Reviewed response time, request rate, and error metrics.  
✅ Understood distributed tracing concepts.

---

# Conclusion

In this lab, we explored Service Map Visualization in APM and learned how it provides visibility into distributed application architecture.

By analyzing service dependencies and performance metrics, engineers can quickly identify bottlenecks, troubleshoot failures, and improve application reliability.

Service Map is an essential feature of modern observability platforms for monitoring complex applications.
