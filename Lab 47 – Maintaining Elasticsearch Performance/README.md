# ⚡ Lab 47: Maintaining Elasticsearch Performance

## 📌 Lab Summary

In this lab, Elasticsearch cluster performance was monitored using Kibana Dev Tools. The health of the cluster, node statistics, JVM memory usage, CPU utilization, and disk consumption were analyzed. Additionally, Index Lifecycle Management (ILM) and Index Rollover concepts were explored to optimize storage management and maintain long-term cluster performance.

---

## 🎯 Objectives

- Monitor Elasticsearch cluster health.
- Analyze node resource utilization.
- Evaluate disk, memory, and CPU usage.
- Understand Index Lifecycle Management (ILM).
- Configure index rollover for large datasets.
- Apply best practices for Elasticsearch performance optimization.

---

## 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| Elasticsearch | 9.x |
| Kibana | 9.x |
| Operating System | Ubuntu 24.04 LTS |
| Interface | Kibana Dev Tools |
| APIs Used | Cluster Health, Nodes Stats, ILM, Rollover |

---

# 📖 Introduction

Elasticsearch performance depends on proper resource management and continuous monitoring. As data volumes grow, administrators must monitor cluster health, optimize JVM memory usage, manage disk consumption, and automate index management.

This lab demonstrates how Elasticsearch monitoring APIs and ILM policies help maintain a healthy and efficient cluster.

---

# 📂 Lab Tasks

## Task 1: Monitor Cluster Health

Retrieve the overall cluster health.

```http
GET /_cluster/health
```

The response includes:

- Cluster status
- Number of nodes
- Active shards
- Unassigned shards
- Cluster name

A healthy production cluster should ideally report:

```
status : green
```

---

## Task 2: View Cluster Nodes

Retrieve information about all cluster nodes.

```http
GET /_cat/nodes?v
```

This command displays:

- Node name
- CPU usage
- Heap percentage
- RAM usage
- Disk utilization
- Node roles
- IP address

This information helps identify overloaded nodes.

---

## Task 3: Monitor JVM Heap Usage

Retrieve JVM statistics.

```http
GET /_nodes/stats/jvm
```

Important metrics include:

- Heap Used
- Heap Max
- Heap Committed
- Garbage Collection statistics

Best Practice:

- Keep JVM heap utilization below **75%**.
- Avoid excessive Garbage Collection (GC).

---

## Task 4: Monitor CPU Usage

Retrieve operating system statistics.

```http
GET /_nodes/stats/os
```

Useful information includes:

- CPU load
- Available processors
- System load averages

High CPU usage may indicate:

- Heavy indexing
- Complex searches
- Insufficient cluster resources

---

## Task 5: Monitor Disk Usage

Retrieve index storage information.

```http
GET /_cat/indices?v
```

Review:

- Store size
- Document count
- Health status

Elasticsearch recommends maintaining at least **15% free disk space** to ensure smooth operation.

---

## Task 6: Create an Index Lifecycle Management (ILM) Policy

Create a simple ILM policy.

```http
PUT _ilm/policy/hot-delete-policy
{
  "policy": {
    "phases": {
      "hot": {
        "actions": {
          "rollover": {
            "max_size": "50gb",
            "max_age": "30d"
          }
        }
      },
      "delete": {
        "min_age": "90d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}
```

This policy:

- Rolls over indices after 30 days or 50 GB.
- Deletes indices after 90 days.

---

## Task 7: Apply the ILM Policy

Attach the policy to an index.

```http
PUT logs-000001
{
  "settings": {
    "index.lifecycle.name": "hot-delete-policy",
    "index.lifecycle.rollover_alias": "logs"
  }
}
```

---

## Task 8: Perform Index Rollover

Create a new index when rollover conditions are met.

```http
POST /logs/_rollover
```

The rollover API automatically creates the next generation index while keeping the alias unchanged.

Example:

```
logs-000001
↓

logs-000002
```

Applications continue writing to the alias without interruption.

---

# 🔍 Key Concepts

## Cluster Health

Displays the overall status of the Elasticsearch cluster.

Possible values:

- Green
- Yellow
- Red

---

## JVM Heap

Java memory allocated to Elasticsearch.

Recommended usage:

- Less than 75%

---

## CPU Utilization

Measures processing load on cluster nodes.

High CPU may indicate:

- Heavy indexing
- Expensive queries
- Resource bottlenecks

---

## Disk Usage

Tracks storage consumed by indices.

Low available disk space can trigger:

- Read-only indices
- Cluster instability

---

## Index Lifecycle Management (ILM)

Automatically manages indices throughout their lifecycle.

Common phases include:

- Hot
- Warm
- Cold
- Frozen
- Delete

---

## Index Rollover

Creates a new write index once predefined conditions are met.

Benefits include:

- Smaller indices
- Faster searches
- Easier maintenance

---

# 💡 Performance Best Practices

- Keep cluster status **Green**.
- Monitor JVM heap regularly.
- Maintain at least **15% free disk space**.
- Use ILM for automated index management.
- Configure index rollover for large datasets.
- Delete obsolete indices.
- Monitor CPU and memory utilization.
- Avoid oversized shards.
- Optimize search queries.
- Scale nodes when resource utilization remains consistently high.

---

# 📊 Outcome

After completing this lab, the following skills were achieved:

- Monitored Elasticsearch cluster health.
- Checked node-level resource utilization.
- Analyzed JVM heap usage.
- Evaluated CPU and disk performance.
- Created an ILM policy.
- Applied lifecycle management to indices.
- Performed index rollover.
- Learned Elasticsearch performance optimization techniques.

---

# ✅ Conclusion

This lab demonstrated the essential techniques for maintaining Elasticsearch performance. By monitoring cluster health, analyzing resource utilization, and implementing Index Lifecycle Management with rollover policies, administrators can ensure that Elasticsearch clusters remain scalable, reliable, and efficient even as data volumes increase. Regular monitoring and proactive optimization are key practices for long-term cluster stability.

---

# 📚 Key Takeaways

- Cluster Health API provides overall cluster status.
- Node statistics help identify resource bottlenecks.
- JVM heap monitoring prevents excessive Garbage Collection.
- ILM automates index lifecycle management.
- Index rollover prevents oversized indices.
- Continuous monitoring improves Elasticsearch performance and reliability.

---
