# 🧪 Lab 16: Data Parsing with Logstash Grok

## 📌 Lab Summary

In this lab, I configured **Logstash** to collect Apache access logs, parse them using the **Grok filter**, and send the structured data to **Elasticsearch**. The parsed log data was then verified for indexing and prepared for visualization in **Kibana Discover**. This lab demonstrates how Logstash transforms unstructured log files into structured and searchable data.

---

## 🎯 Objectives

- Understand the role of Logstash in the Elastic Stack.
- Configure a Logstash pipeline.
- Parse Apache access logs using the Grok filter.
- Send structured log data to Elasticsearch.
- Verify indexed data in Kibana Discover.

---

## 🖥️ Lab Environment

| Component | Details |
|-----------|---------|
| Operating System | Ubuntu Server |
| Elasticsearch | 9.4.3 |
| Kibana | 9.4.3 |
| Logstash | 9.4.3 |
| Log Source | Apache2 Access Log |
| Log File | `/var/log/apache2/access.log` |

---

# 📋 Lab Tasks

## Task 1: Verify Logstash Installation

Verified that Logstash was installed successfully.

```bash
/usr/share/logstash/bin/logstash --version
```

---

## Task 2: Create Logstash Pipeline

Created a Logstash configuration file.

```bash
sudo nano /etc/logstash/conf.d/logstash-grok.conf
```

Configured the pipeline to read Apache access logs.

```ruby
input {
  file {
    path => "/var/log/apache2/access.log"
    start_position => "beginning"
  }
}
```

Added a Grok filter to parse Apache logs.

```ruby
filter {
  grok {
    match => {
      "message" => "%{COMBINEDAPACHELOG}"
    }
  }
}
```

Configured Elasticsearch as the output.

```ruby
output {
  elasticsearch {
    hosts => ["https://localhost:9200"]
    index => "logstash-%{+YYYY.MM.dd}"
    user => "elastic"
    password => "********"
    ssl_enabled => true
    ssl_verification_mode => "none"
  }

  stdout {
    codec => rubydebug
  }
}
```

---

## Task 3: Start the Logstash Pipeline

Started Logstash using the custom configuration.

```bash
sudo -u logstash /usr/share/logstash/bin/logstash \
--path.settings /etc/logstash \
-f /etc/logstash/conf.d/logstash-grok.conf
```

The pipeline initialized successfully and connected to Elasticsearch.

---

## Task 4: Generate Apache Log Data

Generated sample HTTP requests.

```bash
curl http://localhost
```

Repeated the command several times to create Apache access logs.

---

## Task 5: Verify Elasticsearch Indices

Checked whether Elasticsearch received the data.

```bash
curl -k -u elastic:<password> https://localhost:9200/_cat/indices?v
```

Verified that the Logstash output index was available.

---

## Task 6: Verify Parsed Data in Kibana

Opened **Discover** in Kibana.

Selected the **logstash-\*** index pattern.

Verified parsed fields such as:

- Client IP
- HTTP Method
- Request URI
- Response Code
- Bytes Sent
- User Agent
- Timestamp

---

# 📸 Screenshots

## 1️⃣ Logstash Grok Configuration

> Add screenshot showing **logstash-grok.conf**.

---

## 2️⃣ Logstash Pipeline Running Successfully

> Add screenshot showing the Logstash terminal with the running pipeline.

---

## 💡 Key Concepts Learned

### Logstash

A server-side data processing pipeline that collects, transforms, and forwards log data.

### Grok Filter

A Logstash filter plugin used to extract structured information from unstructured log messages using predefined patterns.

### COMBINEDAPACHELOG

A built-in Grok pattern specifically designed for parsing Apache access logs.

### Elasticsearch

Stores parsed log data for searching and analysis.

### Kibana Discover

Allows users to explore indexed log data and perform searches.

---

# 🛠 Commands Used

## Verify Logstash

```bash
/usr/share/logstash/bin/logstash --version
```

## Create Pipeline

```bash
sudo nano /etc/logstash/conf.d/logstash-grok.conf
```

## Start Logstash

```bash
sudo -u logstash /usr/share/logstash/bin/logstash \
--path.settings /etc/logstash \
-f /etc/logstash/conf.d/logstash-grok.conf
```

## Generate Apache Logs

```bash
curl http://localhost
```

## Check Elasticsearch Indices

```bash
curl -k -u elastic:<password> https://localhost:9200/_cat/indices?v
```

---

# 📚 What I Learned

- How Logstash reads log files using the File Input plugin.
- How the Grok filter converts raw log messages into structured fields.
- How Logstash sends parsed events to Elasticsearch.
- How Apache access logs can be indexed for searching and visualization.
- How Kibana Discover can be used to inspect structured log data.

---

# ✅ Conclusion

This lab provided practical experience in building a **Logstash data processing pipeline** using the **Grok filter**. Apache access logs were successfully parsed into structured fields and forwarded to Elasticsearch for centralized storage. This workflow demonstrates how Logstash plays a critical role in transforming raw log data into searchable information that can be analyzed through Kibana, making it an essential component of the Elastic Stack.
