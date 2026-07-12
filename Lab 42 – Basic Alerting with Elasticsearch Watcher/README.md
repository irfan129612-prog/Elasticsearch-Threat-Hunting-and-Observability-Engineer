# 🔔 Lab 42 – Basic Alerting with Elasticsearch Watcher

## 📌 Lab Summary

This lab demonstrates how to create a basic **Watcher** in Elasticsearch using **Kibana Dev Tools**. A watch was configured to monitor log data for critical errors, evaluate search results against a condition, and trigger an action when matching events were detected. Finally, test data was indexed to validate the watch execution.

---

## 🎯 Objectives

- Understand the basics of Elasticsearch Watcher.
- Create a Watch using Kibana Dev Tools.
- Configure search queries and alert conditions.
- Add email or webhook alert actions.
- Test the Watch by indexing sample data.
- Verify Watch execution and results.

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

Elasticsearch Watcher is an alerting feature that continuously monitors data stored in Elasticsearch. It evaluates conditions based on scheduled searches and automatically performs predefined actions such as sending email notifications or invoking webhooks when specified conditions are met.

---

# 📂 Lab Tasks

## Task 1: Open Kibana Dev Tools

Navigate to:

```
Management
    └── Dev Tools
```

Open the **Console** to execute Watcher API requests.

---

## Task 2: Create a Watch

Create a watch that searches for critical errors in log indices.

Example:

```json
PUT _watcher/watch/log_error_watch
{
  "trigger": {
    "schedule": {
      "interval": "10s"
    }
  },
  "input": {
    "search": {
      "request": {
        "indices": [
          "logs-*"
        ],
        "body": {
          "query": {
            "match": {
              "error": "critical"
            }
          }
        }
      }
    }
  },
  "condition": {
    "compare": {
      "ctx.payload.hits.total": {
        "gt": 0
      }
    }
  }
}
```

This watch executes every **10 seconds** and searches for documents containing critical errors.

---

## Task 3: Configure Alert Actions

Configure an action that executes when the watch condition is satisfied.

### Email Action

```json
"actions": {
  "email_admin": {
    "email": {
      "to": "admin@example.com",
      "subject": "Critical Error Detected",
      "body": "A critical error has been detected."
    }
  }
}
```

### Webhook Action

```json
"actions": {
  "notify_webhook": {
    "webhook": {
      "method": "POST",
      "url": "http://example.com/alerts",
      "body": "{{ctx.payload}}"
    }
  }
}
```

---

## Task 4: Insert Test Data

Index a sample document that satisfies the watch condition.

```json
POST logs/_doc/
{
  "timestamp": "2026-07-12T12:00:00",
  "error": "critical",
  "message": "Critical error detected on server."
}
```

---

## Task 5: Verify Watch Execution

Use Kibana Dev Tools to inspect the Watch.

Example:

```json
GET _watcher/watch/log_error_watch
```

View Watch execution history:

```json
GET .watcher-history*/_search
```

Confirm that the Watch executed successfully and detected the matching document.

---

# 🔍 Key Concepts

## Watch

A scheduled task that monitors Elasticsearch data and executes actions when predefined conditions are met.

---

## Trigger

Determines when the Watch runs.

Example:

```
Every 10 seconds
```

---

## Input

Defines the search request used by the Watch.

---

## Condition

Evaluates whether the search results satisfy specific criteria.

---

## Action

Specifies the response performed after a successful condition match.

Examples:

- Email Notification
- Webhook
- Logging
- Index Action

---

# 💡 Use Cases

Watcher is commonly used for:

- Critical application error monitoring
- Failed login detection
- Server health monitoring
- Security event alerting
- Infrastructure monitoring
- Threshold-based notifications
- Operational monitoring

---

# 📊 Outcome

After completing this lab, the following skills were achieved:

- Created a Watch using Kibana Dev Tools.
- Configured scheduled monitoring.
- Added search conditions.
- Configured alert actions.
- Indexed sample data for testing.
- Verified successful Watch execution.

---

# ✅ Conclusion

This lab introduced Elasticsearch Watcher for automated monitoring and alerting. By creating scheduled watches, defining search conditions, and configuring actions, analysts can automatically detect critical events and receive timely notifications for faster incident response.

---

# 📚 Key Takeaways

- Watcher automates monitoring tasks.
- Watches execute on scheduled intervals.
- Conditions determine when alerts are generated.
- Actions notify administrators automatically.
- Watcher improves operational visibility and incident response.

---
