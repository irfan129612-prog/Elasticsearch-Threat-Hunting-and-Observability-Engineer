# 🛡️ Lab 49 – Setting Up a Lab-Scale Threat Simulation

## 📌 Lab Summary

In this lab, a small-scale cyber attack simulation was performed using the Elastic Stack. Multiple failed SSH login attempts were generated to imitate a brute-force attack. Authentication logs were collected, forwarded into Elasticsearch, and investigated through Kibana Security. This lab demonstrates how security analysts validate log ingestion, detection rules, and alert generation in a controlled environment.

---

## 🎯 Objectives

- Build a small threat simulation lab.
- Simulate multiple failed SSH login attempts.
- Collect authentication logs.
- Forward logs to Elasticsearch.
- Investigate alerts in Kibana Security.
- Understand the complete detection workflow.

---

# 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| Operating System | Ubuntu 24.04 LTS |
| Elasticsearch | 9.x |
| Kibana | 9.x |
| Logstash | 9.x |
| Filebeat | 9.x |
| Terminal | Bash |
| Browser | Google Chrome |

---

# 📖 Introduction

Threat simulation allows SOC analysts to safely reproduce common attacks in a lab environment. Rather than waiting for real attacks, analysts generate controlled events and verify that logging, detection rules, and alerts work correctly.

In this lab, repeated failed SSH login attempts were generated and monitored through the Elastic Security platform.

---

# 📂 Lab Tasks

## Task 1: Prepare the Lab Environment

Verified that the Elastic Stack services were running.

```bash
sudo systemctl status elasticsearch
sudo systemctl status kibana
sudo systemctl status logstash
sudo systemctl status filebeat
```

---

## Task 2: Simulate Failed SSH Login Attempts

A Bash script was created to repeatedly attempt authentication with invalid credentials.

Example:

```bash
#!/bin/bash

HOST="localhost"
USER="invaliduser"

for i in {1..5}
do
    ssh $USER@$HOST
done
```

This generated multiple failed authentication events inside:

```
/var/log/auth.log
```

---

## Task 3: Verify Authentication Logs

Authentication logs were monitored.

```bash
sudo tail -f /var/log/auth.log
```

Typical log example:

```
Failed password for invalid user
```

---

## Task 4: Configure Log Collection

Authentication logs were collected using Filebeat or Logstash.

Example Logstash Input

```conf
input {
  file {
    path => "/var/log/auth.log"
    start_position => "beginning"
  }
}
```

Example Grok Filter

```conf
filter {
  grok {
    match => {
      "message" => "%{SYSLOGTIMESTAMP:timestamp} %{SYSLOGHOST:host} %{DATA:process}: %{GREEDYDATA:message}"
    }
  }
}
```

Output

```conf
output {
  elasticsearch {
    hosts => ["http://localhost:9200"]
    index => "ssh_access"
  }
}
```

---

## Task 5: Verify Data in Elasticsearch

Confirmed that authentication logs were indexed.

```bash
curl -X GET "localhost:9200/ssh_access/_search?pretty"
```

---

## Task 6: Investigate in Kibana

Opened:

```
Security
    └── Alerts
```

and

```
Discover
```

Reviewed:

- Failed login attempts
- Username
- Source host
- Timestamp
- Authentication events

---

## Task 7: Trigger Detection Rules

Enabled built-in Elastic Security authentication rules.

Generated additional failed logins.

Observed alerts inside:

```
Security
    └── Alerts
```

---

# 🔍 Important Concepts

## Threat Simulation

Controlled generation of attack activity for testing SIEM detections.

---

## Failed Login Attack

Repeated authentication failures that may indicate brute-force attacks.

---

## Log Ingestion

Process of collecting logs from endpoints into Elasticsearch.

---

## Detection Rule

Logic used by Elastic Security to identify suspicious behavior.

---

## Security Alert

Notification generated after a rule matches suspicious events.

---

# 📊 Investigation Workflow

```
Failed SSH Login
        │
        ▼
Authentication Logs
        │
        ▼
Filebeat / Logstash
        │
        ▼
Elasticsearch
        │
        ▼
Elastic Security Rules
        │
        ▼
Security Alerts
        │
        ▼
SOC Investigation
```

---

# 💡 Use Cases

This workflow is commonly used for:

- Brute-force attack detection
- SSH monitoring
- Insider threat detection
- SOC analyst training
- Threat hunting
- Detection rule validation
- Incident response practice

---

# 📚 Common Investigation Queries

Failed logins

```kql
event.category : authentication
```

Authentication failures

```kql
event.outcome : failure
```

SSH events

```kql
process.name : sshd
```

Specific user

```kql
user.name : "invaliduser"
```

---

# 📊 Outcome

After completing this lab, the following skills were achieved:

- Created a threat simulation environment.
- Simulated SSH brute-force attempts.
- Verified authentication log collection.
- Indexed logs into Elasticsearch.
- Investigated events in Kibana.
- Triggered Elastic Security alerts.
- Understood the complete detection workflow.

---


# ✅ Conclusion

This lab demonstrated how to simulate a basic cyber attack in a safe environment using the Elastic Stack. By generating failed SSH logins, collecting authentication logs, and investigating alerts in Kibana Security, the complete detection pipeline—from log generation to security alerting—was validated. Such simulations help SOC analysts improve monitoring, threat detection, and incident response capabilities.

---

# 📚 Key Takeaways

- Threat simulation validates SIEM deployments.
- Failed login events are valuable indicators of brute-force attacks.
- Filebeat and Logstash simplify log collection.
- Elastic Security detects suspicious authentication behavior.
- Regular testing improves detection accuracy and SOC readiness.

---
