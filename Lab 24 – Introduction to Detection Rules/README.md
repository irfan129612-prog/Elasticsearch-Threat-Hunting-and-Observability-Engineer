# 🛡️ Lab 24: Introduction to Detection Rules

## 📌 Lab Summary

In this lab, the **Detection Rules** feature of **Elastic Security** was explored to understand how Elastic automatically detects suspicious activities. A prebuilt detection rule was reviewed and enabled, a test event was generated, and the resulting security alert was verified in the **Alerts** section. Detection Rules are a core component of Security Information and Event Management (SIEM) and help analysts detect malicious behavior in real time.

---

## 🎯 Objectives

- Understand the purpose of Detection Rules in Elastic Security.
- Explore prebuilt detection rules.
- Enable a detection rule.
- Generate a test event to trigger the rule.
- Verify generated alerts in Elastic Security.

---

## 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| SIEM Platform | Elastic Security |
| Elasticsearch | 9.x |
| Kibana | 9.x |
| Operating System | Ubuntu 24.04 LTS |
| Browser | Google Chrome |

---

# 📖 Introduction

Detection Rules continuously analyze incoming events and compare them against predefined conditions. When suspicious activity matches a rule, Elastic Security automatically generates an alert, allowing security analysts to investigate potential threats quickly.

Elastic provides hundreds of **prebuilt detection rules** covering:

- Malware activity
- Privilege escalation
- Persistence techniques
- Credential access
- Lateral movement
- Suspicious process execution
- Network anomalies

---

# 📂 Lab Tasks

## Task 1: Open Detection Rules

Open Kibana and navigate to:

```
Security
    └── Rules
```

The Rules page displays all available detection rules, including both prebuilt and custom rules.

---

## Task 2: Explore Prebuilt Detection Rules

Browse the available detection rules.

Review important information such as:

- Rule Name
- Rule Type
- Severity
- Risk Score
- Status
- MITRE ATT&CK Technique

Example rule:

```
Suspicious Process Execution
```

---

## Task 3: Enable a Detection Rule

Locate a disabled rule.

Click **Enable** to activate it.

After enabling, verify that the rule status changes to:

```
Enabled
```

Elastic Security will now monitor incoming events using this rule.

---

## Task 4: Generate a Test Event

Open the terminal and create a simple test script.

```bash
echo "Simulating suspicious process execution" > /tmp/suspicious.sh
```

Make the script executable.

```bash
chmod +x /tmp/suspicious.sh
```

Run the script.

```bash
/tmp/suspicious.sh
```

This generates a process execution event that may be detected by an enabled rule depending on the configured integrations and datasets.

---

## Task 5: Verify Detection Alerts

Return to Kibana and navigate to:

```
Security
    └── Alerts
```

Review the generated alerts.

Verify information such as:

- Alert Name
- Severity
- Host Name
- User
- Timestamp
- Rule Name

Open the alert to review detailed event information.

---

## Task 6: Investigate the Alert

Select the generated alert.

Review available information including:

- Process Details
- Host Information
- User Account
- Related Events
- Timeline Investigation
- Alert Reason

This information helps analysts understand why the alert was triggered.

---

# 🔍 Key Concepts

## Detection Rule

A predefined or custom rule that continuously monitors events and generates alerts when suspicious behavior is detected.

---

## Alert

A security notification created when a detection rule matches incoming event data.

---

## Prebuilt Rules

Rules provided by Elastic based on common attack techniques and threat intelligence.

---

## Rule Severity

Indicates the importance of an alert.

Common levels include:

- Low
- Medium
- High
- Critical

---

## Risk Score

A numerical value representing the potential impact of the detected activity.

---

## MITRE ATT&CK Mapping

Many Elastic detection rules are mapped to MITRE ATT&CK techniques to simplify threat analysis.

---

# 💡 Use Cases

Detection Rules help identify:

- Suspicious process execution
- Privilege escalation
- Brute-force attacks
- Malware execution
- Unauthorized logins
- Credential theft
- Lateral movement
- Persistence techniques

---

# 📊 Outcome

After completing this lab, the following tasks were successfully performed:

- Explored Elastic prebuilt detection rules.
- Enabled a detection rule.
- Generated a test process event.
- Verified alert generation.
- Investigated alert details.
- Understood the role of detection rules in threat detection.

---

## 📷 Screenshot

## Elastic Security Detection Rules 
![](rules.png)

---

# ✅ Conclusion

This lab introduced the Detection Rules feature in Elastic Security and demonstrated how prebuilt rules can automatically identify suspicious activities. By enabling a rule, generating a test event, and reviewing the resulting alert, a basic detection and investigation workflow was completed. Detection Rules form the foundation of proactive threat detection and are essential for effective SOC operations.

---

# 📚 Key Takeaways

- Detection Rules continuously monitor security events.
- Prebuilt rules simplify threat detection.
- Alerts are automatically generated when rule conditions are met.
- Alert investigations provide detailed security context.
- Detection Rules improve incident detection and response capabilities.

---
