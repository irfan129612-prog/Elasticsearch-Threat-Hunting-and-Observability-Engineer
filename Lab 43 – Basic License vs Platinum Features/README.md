# 📄 Lab 43: Basic License vs Platinum Features (Awareness)

## 📌 Lab Summary

This lab explores the differences between the **Basic** and **Platinum** licenses in the Elastic Stack. The Basic license provides essential features for data ingestion, visualization, security, and monitoring, while the Platinum license unlocks advanced capabilities such as machine learning, advanced alerting, and enterprise authentication. Understanding these licensing models helps organizations choose the most appropriate deployment based on their technical and business requirements.

---

## 🎯 Objectives

- Understand the Elastic licensing model.
- Compare Basic and Platinum features.
- Identify which features are available with the Basic license.
- Learn deployment and licensing considerations.
- Determine when upgrading to Platinum is beneficial.

---

## 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| Elasticsearch | 9.x |
| Kibana | 9.x |
| Operating System | Ubuntu 24.04 LTS |
| Browser | Google Chrome |

---

# 📖 Introduction

Elastic provides different subscription levels that enable varying functionality within Elasticsearch and Kibana. Most learning environments and small deployments use the **Basic (Free)** license, while enterprise organizations often use **Platinum** to gain access to advanced security, machine learning, and alerting capabilities.

Understanding these differences helps security teams plan deployments and optimize licensing costs.

---

# 📂 Lab Tasks

## Task 1: Check Current License

Verify the currently installed Elastic license.

Using Kibana:

```
Management
    └── Stack Management
            └── License Management
```

Or use the Elasticsearch API:

```http
GET /_license
```

Review the following information:

- License type
- Status
- Expiration date
- Available features

---

## Task 2: Compare Basic and Platinum Features

| Feature | Basic | Platinum |
|----------|:-----:|:---------:|
| Elasticsearch | ✅ | ✅ |
| Kibana Dashboards | ✅ | ✅ |
| Discover | ✅ | ✅ |
| Lens Visualizations | ✅ | ✅ |
| Filebeat / Metricbeat | ✅ | ✅ |
| Packetbeat / Heartbeat | ✅ | ✅ |
| RBAC Security | ✅ | ✅ |
| TLS Encryption | ✅ | ✅ |
| API Keys | ✅ | ✅ |
| Watcher Alerting | Limited | Advanced |
| Machine Learning | ❌ | ✅ |
| Detection Engine | Basic | Advanced |
| Case Management | Limited | Advanced |
| SAML / SSO | ❌ | ✅ |
| Advanced Alert Actions | ❌ | ✅ |
| Cross Cluster Security | ❌ | ✅ |

---

## Task 3: Review Available Features

Determine which Elastic Security features are available under the current license.

Examples include:

- Dashboards
- Discover
- Data Views
- Security
- Beats
- Fleet
- Visualizations

Document any unavailable enterprise features.

---

## Task 4: Licensing Considerations

Evaluate when each license is appropriate.

### Basic License

Suitable for:

- Home Labs
- Learning
- Small Businesses
- Development
- SOC Practice Labs
- Personal Projects

### Platinum License

Suitable for:

- Enterprise SOC
- Large Organizations
- Compliance Requirements
- Advanced Threat Detection
- Machine Learning
- Enterprise Authentication
- Advanced Incident Response

---

# 🔍 Key Concepts

## Basic License

A free Elastic license that includes essential Elasticsearch and Kibana functionality.

---

## Platinum License

A commercial Elastic subscription that provides enterprise-grade security, monitoring, machine learning, and advanced alerting.

---

## Machine Learning

Automatically detects anomalies and unusual behavior in indexed data.

---

## Role-Based Access Control (RBAC)

Controls user permissions and resource access within the Elastic Stack.

---

## SAML Authentication

Enterprise Single Sign-On (SSO) integration using Security Assertion Markup Language.

---

# 💡 Use Cases

### Basic License

- SIEM Learning
- Log Monitoring
- Dashboard Creation
- Threat Hunting Practice
- Personal Security Labs
- Small Deployments

### Platinum License

- Enterprise SOC
- Managed Security Operations
- Threat Detection
- Compliance Monitoring
- Large-Scale Infrastructure
- Machine Learning Analytics

---

# 📊 Outcome

After completing this lab, the following skills were achieved:

- Compared Basic and Platinum licensing.
- Identified free Elastic features.
- Reviewed enterprise capabilities.
- Understood deployment considerations.
- Evaluated licensing requirements for different environments.

---

# ✅ Conclusion

This lab provided an overview of Elastic's licensing model and highlighted the differences between Basic and Platinum subscriptions. While the Basic license is sufficient for learning, development, and many production use cases, Platinum adds enterprise-grade capabilities such as machine learning, advanced alerting, and SAML authentication for organizations with more complex security and operational requirements.

---

# 📚 Key Takeaways

- Basic License is free and suitable for most learning environments.
- Platinum unlocks enterprise security and analytics features.
- Licensing should align with organizational needs.
- Understanding feature availability helps optimize deployment costs.
- Most SIEM lab exercises can be completed using the Basic license.

---
