# Lab 33 – Synthetic Monitoring Basics

## 📌 Lab Overview

In this lab, we explored the fundamentals of **Synthetic Monitoring** using Elastic Heartbeat and Kibana Observability.

Synthetic monitoring simulates real user activities on applications and websites to continuously check availability, performance, and user experience.

In this lab, we configured a browser-based synthetic journey, visualized monitoring results in Kibana Uptime UI, and analyzed failures and response time issues.

---

# 🎯 Lab Objectives

- Understand the fundamentals of synthetic monitoring.
- Configure browser-based journeys using Heartbeat.
- Explore Synthetic Monitoring in Kibana.
- Monitor application availability.
- Identify failures and high response times.
- Analyze synthetic test results.

---

# 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| Monitoring Tool | Elastic Heartbeat |
| Visualization | Kibana Uptime / Synthetic Monitoring |
| Data Storage | Elasticsearch |
| Platform | Elastic Observability |
| Configuration | YAML |

---

# 📚 Introduction to Synthetic Monitoring

## What is Synthetic Monitoring?

Synthetic Monitoring is a proactive monitoring technique that simulates user interactions with applications.

Instead of waiting for users to report issues, synthetic monitoring automatically checks:

- Website availability.
- Application performance.
- User workflows.
- Response times.

---

## Synthetic Monitoring Workflow

```
Synthetic Test
      |
      |
Heartbeat Agent
      |
      |
Elasticsearch
      |
      |
Kibana Uptime Dashboard
```

---

# Task 1: Define Browser-Based Journey in Heartbeat

## Install Heartbeat

Install Elastic Heartbeat:

```bash
sudo apt-get install heartbeat
```

Heartbeat is a lightweight monitoring agent used to check service availability and performance.

---

# Configure Heartbeat

Edit configuration file:

```bash
sudo nano /etc/heartbeat/heartbeat.yml
```

---

## Browser Synthetic Journey Configuration

Example browser monitor:

```yaml
heartbeat.monitors:

- type: browser
  name: "Sample E-Commerce Journey"
  id: synthetic-test-1
  schedule: '@every 1m'

  source:
    inline:
      script: |

        step('load homepage', async () => {
          await page.goto('https://example-ecommerce.com');
        });

        step('search product', async () => {
          await page.type('[data-test=search-box]', 'laptop');
          await page.click('[data-test=search-button]');
        });

        step('navigate to product', async () => {
          await page.click('[data-test=product-link]');
        });
```

---

## Validate Heartbeat Configuration

Test configuration:

```bash
heartbeat -e -c /etc/heartbeat/heartbeat.yml test config
```

Successful validation confirms that the configuration is correct.

---

## Start Heartbeat Service

Start monitoring:

```bash
sudo service heartbeat start
```

Enable at system startup:

```bash
sudo systemctl enable heartbeat
```

---

# Task 2: Explore Synthetic Monitoring UI in Kibana

## Access Kibana

Open:

```
http://localhost:5601
```

---

## Navigate to Uptime Application

From Kibana:

```
Observability → Uptime
```

The Uptime application displays:

- Monitor status.
- Availability data.
- Response times.
- Failed checks.

---

# Verify Synthetic Tests

Check that the configured monitor appears:

Example:

```
Sample E-Commerce Journey
```

Verify:

- Monitor status.
- Successful execution steps.
- Execution history.

---

# Task 3: Analyze Failures and High Response Times

## Monitor Results Analysis

Use Kibana Uptime filters to identify:

- Failed monitors.
- Slow responses.
- Availability issues.

---

## Debug Synthetic Failures

Investigate:

- Error messages.
- Screenshots.
- Failed steps.
- Browser interactions.

Example:

```
Element Not Found
        ↓
UI Change Detected
        ↓
Synthetic Test Failed
```

---

## Analyze High Response Times

High response time may indicate:

- Slow server response.
- Network issues.
- Application performance problems.
- Inefficient UI loading.

---

## Historical Analysis

Use Kibana timeline features to analyze:

- Performance trends.
- Availability history.
- Repeated failures.

---

# 🔐 SOC & Security Use Cases

Synthetic monitoring can support security and operations teams.

## Availability Monitoring

Detect:

- Service downtime.
- Website failures.
- Application outages.

---

## Security Monitoring

Identify:

- Unexpected application behavior.
- Unauthorized changes affecting user journeys.
- Performance degradation caused by attacks.

---

## Incident Workflow

```
Synthetic Failure
        ↓
Kibana Alert
        ↓
Investigation
        ↓
Issue Resolution
```

---

# 🧠 Key Learning Outcomes

After completing this lab:

✅ Learned synthetic monitoring concepts.  
✅ Configured browser-based Heartbeat monitoring.  
✅ Created synthetic user journeys.  
✅ Explored Kibana Uptime dashboard.  
✅ Identified application failures and performance issues.  
✅ Understood proactive application monitoring.

---

# Conclusion

In this lab, we configured synthetic monitoring using Elastic Heartbeat and analyzed monitoring results through Kibana Uptime.

Synthetic monitoring provides proactive visibility into application availability and performance by continuously simulating user interactions.

This capability helps organizations detect issues before they impact real users and improves application reliability.
