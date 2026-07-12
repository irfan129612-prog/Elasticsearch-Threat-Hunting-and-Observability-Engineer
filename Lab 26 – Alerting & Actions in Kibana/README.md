# Lab 26 – Alerting & Actions in Kibana

## 📌 Lab Overview

In this lab, we configured the Alerting and Actions functionality in Kibana. The purpose of this lab was to understand how to create alert rules, configure notification actions, set up an SMTP email connector, and verify alert delivery.

Kibana Alerting is an important feature used in monitoring and SIEM environments to automatically notify security teams when specific conditions or suspicious activities are detected.

---

## 🎯 Objectives

- Understand how to create alerts in Kibana.
- Learn how to configure actions for alerts.
- Set up an SMTP email connector.
- Configure email notifications.
- Validate alert triggering and notification delivery.

---

## 🛠️ Lab Environment

 Component  Details 
-------------------
 SIEM Platform  Elastic Stack 
 Monitoring Tool  Kibana 
 Alert Management  Kibana Alerts & Actions 
 Notification Method  Email (SMTP) 

---

# Task 1 Accessing Alerts and Actions

## Open Kibana Dashboard

1. Open Kibana interface in a web browser.
2. Navigate to

```
Stack Management → Alerts and Insights → Alerts and Actions
```

3. Verify that the alert management page is accessible.

The Alerts and Actions section allows administrators to

- Create alert rules.
- Manage connectors.
- Configure automated notifications.
- Monitor alert status.

---

# Task 2 Setting Up an Email Connector

## Create Email Connector

Steps

1. Go to

```
Stack Management → Alerts and Insights → Connectors
```

2. Click on

```
Create Connector
```

3. Select

```
Email Connector
```

---

## SMTP Configuration

Configure the SMTP server details

 Field  Description 
-------------------
 Host  SMTP server address 
 Port  SMTP communication port 
 Secure  TLSSSL configuration 
 Username  Email account username 
 Password  Email account password 

Example SMTP configuration

```json
{
  host smtp.example.com,
  port 587,
  secure false,
  username your-username,
  password your-password
}
```

---

## Test Connector

After configuring the email connector

- Use the Send Test Email option.
- Verify that the email is successfully delivered.
- Confirm SMTP settings are working correctly.

---

# Task 3 Configuring Alert Rules

## Create New Alert Rule

Navigate to

```
Alerts and Actions → Alerts → Create Alert Rule
```

Define

- Rule name.
- Data sourceindex.
- Query conditions.
- Alert threshold.
- Alert schedule.

---

## Define Alert Conditions

Example

```
Trigger an alert when error logs reach 10 occurrences within 5 minutes.
```

Alert rules can monitor

- Failed login attempts.
- Security events.
- Application errors.
- System activities.

---

## Assign Alert Action

Add an action using the previously created email connector.

Example email action configuration

```json
{
  actionTypeId .email,
  config {
    to [
      recipient@example.com
    ],
    subject Kibana Alert Triggered,
    message An alert has been triggered based on the defined conditions.
  }
}
```

---

# Task 4 Verification

## Simulate Alert Trigger

Generate test events according to the configured alert condition.

Examples

- Multiple failed authentication attempts.
- High severity error logs.
- Suspicious activity events.

Once the threshold is reached, Kibana will trigger the configured alert.

---

## Verify Email Notification

Check the configured email inbox and verify

- Notification email is received.
- Alert subject is correct.
- Alert message contains required information.
- Action workflow is working properly.

---

# 🔐 SOC Analyst Use Cases

Kibana Alerting is commonly used in Security Operations Centers for

### Brute Force Detection

```
Multiple Failed Login Attempts
            ↓
Kibana Alert Rule Triggered
            ↓
Email Notification Sent
            ↓
SOC Analyst Investigation
```

### Other Use Cases

- Unauthorized access detection.
- Malware activity monitoring.
- Security incident notification.
- Server monitoring.
- Log-based threat detection.

---

# 🧠 Key Learning Outcomes

After completing this lab

✅ Learned how to access Kibana Alerts and Actions.  
✅ Created and configured alert rules.  
✅ Configured SMTP email notifications.  
✅ Attached actions with alert rules.  
✅ Understood automated alert workflows in SIEM environments.

---

# Conclusion

In this lab, Kibana Alerting and Actions were successfully configured. An SMTP email connector was created and attached to alert rules to send automated notifications when predefined conditions were met.

This lab provided practical experience with SIEM alert management and demonstrated how security teams use automated notifications for faster detection and response.
