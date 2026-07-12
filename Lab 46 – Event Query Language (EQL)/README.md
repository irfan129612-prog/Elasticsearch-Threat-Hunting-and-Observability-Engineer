# 🔍 Lab 46: Basic EQL (Event Query Language) Usage

## 📌 Lab Summary

In this lab, Event Query Language (EQL) was used within **Elastic Security** to search and correlate security events. Simple sequence queries were executed to identify related process and network activities. The lab demonstrated how EQL helps analysts detect suspicious behaviors by matching sequences of events instead of isolated logs.

---

## 🎯 Objectives

- Understand the fundamentals of Event Query Language (EQL).
- Learn the syntax of basic EQL queries.
- Execute sequence-based event searches.
- Analyze query results.
- Refine EQL queries using additional conditions.
- Perform basic threat hunting using Elastic Security.

---

## 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| SIEM Platform | Elastic Security |
| Elasticsearch | 9.x |
| Kibana | 9.x |
| Operating System | Ubuntu 24.04 LTS |
| Query Language | Event Query Language (EQL) |

---

# 📖 Introduction

Event Query Language (EQL) is a specialized query language designed for searching and correlating security events. Unlike traditional searches, EQL allows analysts to identify sequences of related events, making it highly effective for threat hunting, incident response, and behavioral analysis.

EQL is commonly used within the Elastic Security application to detect suspicious activities such as process execution followed by network connections, privilege escalation, malware execution, and lateral movement.

---

# 📂 Lab Tasks

## Task 1: Open the EQL Search Interface

Navigate to:

```
Kibana
    └── Security
            └── Timelines
                    └── EQL Search
```

Alternatively, EQL queries can also be executed from **Dev Tools** if supported.

---

## Task 2: Execute a Basic Sequence Query

Run the following EQL query:

```eql
sequence
  [process where event.action == "start"]
  [network where event.action == "connection" and destination.port == 80]
```

This query searches for:

- A process start event
- Followed by
- A network connection on port 80

This helps identify applications that immediately establish HTTP connections.

---

## Task 3: Analyze the Results

Review the returned events and examine fields such as:

- @timestamp
- host.name
- process.name
- process.pid
- destination.ip
- destination.port
- event.action
- user.name

Determine whether the observed behavior is expected or potentially suspicious.

---

## Task 4: Refine the Query

Add additional filters to narrow down the results.

Example:

```eql
sequence
  [process where event.action == "start" and process.name == "apache"]
  [network where event.action == "connection" and destination.port == 80]
```

This query only tracks Apache processes that establish HTTP connections.

---

## Task 5: Perform Additional Threat Hunting

Examples of useful EQL queries:

### Detect Bash Execution

```eql
process
where process.name == "bash"
```

---

### Detect SSH Connections

```eql
network
where destination.port == 22
```

---

### Detect Curl Usage

```eql
process
where process.name == "curl"
```

---

### Detect Failed Authentication Events

```eql
authentication
where event.outcome == "failure"
```

---

### Detect Multiple Related Events

```eql
sequence
  [authentication where event.outcome=="failure"]
  [authentication where event.outcome=="success"]
```

This sequence may indicate a brute-force login followed by successful authentication.

---

# 🔍 Key Concepts

## Event Query Language (EQL)

A query language designed to detect relationships between multiple events.

---

## Sequence Query

Searches for events occurring in a specific order.

Example:

```eql
sequence
  [process]
  [network]
```

---

## Process Event

Represents execution of an application or process.

Examples include:

- bash
- curl
- ssh
- apache2
- python3

---

## Network Event

Represents inbound or outbound network communication.

Useful fields include:

- destination.ip
- destination.port
- source.ip

---

## Where Clause

Filters events based on specified conditions.

Example:

```eql
process
where process.name == "curl"
```

---

## Threat Hunting

The proactive process of searching for suspicious activities that may not yet have generated alerts.

---

# 💡 Use Cases

EQL is commonly used for:

- Malware detection
- Process-to-network correlation
- Privilege escalation detection
- Suspicious process execution
- SSH activity monitoring
- Web server monitoring
- Threat hunting
- Incident response
- Behavioral analytics

---

# 📊 Outcome

After completing this lab, the following skills were achieved:

- Accessed the EQL query interface.
- Executed basic EQL queries.
- Created sequence-based event searches.
- Analyzed returned security events.
- Refined queries with additional conditions.
- Performed introductory threat hunting using EQL.

---

## 📷 Screenshot

> **Screenshot 1:** Elastic Security displaying EQL query results for a sequence of process execution followed by a network connection.

---

# ✅ Conclusion

This lab introduced the core concepts of Event Query Language (EQL) within Elastic Security. By creating and executing sequence queries, analyzing results, and refining searches, analysts can efficiently detect complex attack behaviors that would be difficult to identify using simple searches alone. EQL is an essential tool for modern SOC operations, enabling faster threat hunting and more effective incident investigations.

---

# 📚 Key Takeaways

- EQL searches relationships between multiple events.
- Sequence queries detect ordered attack behaviors.
- Filters improve search precision.
- EQL supports advanced threat hunting.
- Elastic Security integrates EQL for incident investigation.

---

