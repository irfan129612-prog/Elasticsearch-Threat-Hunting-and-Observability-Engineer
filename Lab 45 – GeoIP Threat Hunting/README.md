# 🌍 Lab 45: Simple GeoIP Threat Hunting

## 📌 Lab Summary

This lab demonstrates how to enrich IP address information with **GeoIP** data using the Elastic Stack. By configuring Logstash (or Filebeat) with the GeoIP filter, source IP addresses are converted into geographical locations. The enriched data is then visualized on a world map in Kibana, allowing security analysts to identify suspicious login attempts originating from unexpected countries or regions.

---

## 🎯 Objectives

- Understand GeoIP enrichment in the Elastic Stack.
- Configure Logstash to enrich IP addresses with location data.
- Index enriched events into Elasticsearch.
- Visualize geolocation data using Kibana Maps.
- Identify unusual login attempts from unexpected regions.

---

## 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| Elasticsearch | 9.x |
| Kibana | 9.x |
| Logstash | 9.x |
| GeoLite2 Database | MaxMind GeoLite2 City |
| Operating System | Ubuntu 24.04 LTS |

---

# 📖 Introduction

GeoIP enrichment converts IP addresses into meaningful geographical information such as country, city, latitude, and longitude. This information is valuable for security investigations because analysts can quickly identify suspicious login attempts from unfamiliar or high-risk regions.

The Logstash **GeoIP Filter** uses the MaxMind GeoLite2 database to perform this enrichment before indexing events into Elasticsearch.

---

# 📂 Lab Tasks

## Task 1: Prepare the Environment

Ensure the following services are installed and running:

- Elasticsearch
- Kibana
- Logstash

Download the free **GeoLite2 City** database from MaxMind and place it in a location accessible by Logstash.

Example:

```
/etc/logstash/GeoLite2-City.mmdb
```

---

## Task 2: Configure GeoIP Enrichment

Create a Logstash pipeline.

Example:

```ruby
input {
  file {
    path => "/var/log/auth.log"
    start_position => "beginning"
  }
}

filter {
  geoip {
    source => "client_ip"
    target => "geoip"
    database => "/etc/logstash/GeoLite2-City.mmdb"
  }
}

output {
  elasticsearch {
    hosts => ["http://localhost:9200"]
    index => "geoip-threat-hunting"
  }

  stdout {
    codec => rubydebug
  }
}
```

The GeoIP filter automatically adds fields such as:

- Country
- City
- Latitude
- Longitude
- geoip.location

---

## Task 3: Start Logstash

After saving the configuration, start the Logstash service.

Verify that events are successfully indexed into Elasticsearch.

---

## Task 4: Verify Data

Check that the new index has been created.

Example:

```
geoip-threat-hunting
```

Confirm that the documents contain the following fields:

- geoip.country_name
- geoip.city_name
- geoip.location

---

## Task 5: Visualize Data in Kibana

Navigate to:

```
Analytics
    └── Maps
```

Create a new map.

Select the index:

```
geoip-threat-hunting
```

Choose the field:

```
geoip.location
```

The map displays the geographical location of incoming events.

---

## Task 6: Threat Hunting

Analyze the map for unusual activity.

Examples include:

- Login attempts from unfamiliar countries
- Unexpected foreign IP addresses
- Multiple logins from geographically distant locations
- High-volume authentication attempts

These indicators may suggest:

- Credential attacks
- Brute-force attempts
- VPN usage
- Compromised accounts

---

# 🔍 Key Concepts

## GeoIP

Maps an IP address to its geographical location.

---

## GeoLite2

A free IP geolocation database provided by MaxMind.

---

## GeoIP Filter

A Logstash filter plugin used to enrich events with geographical information.

---

## Kibana Maps

A visualization tool that displays geographical data on an interactive world map.

---

## Threat Hunting

The proactive process of searching for suspicious or malicious activity within collected log data.

---

# 💡 Use Cases

GeoIP enrichment is commonly used for:

- Threat Hunting
- Login Monitoring
- VPN Detection
- Brute Force Detection
- Geographic Access Monitoring
- Compliance Reporting
- SOC Investigations
- Incident Response

---

# 📊 Outcome

After completing this lab, the following skills were achieved:

- Configured GeoIP enrichment using Logstash.
- Indexed enriched events into Elasticsearch.
- Created a Kibana Maps visualization.
- Located login events geographically.
- Identified suspicious login locations.
- Improved threat hunting capabilities.

---

# ✅ Conclusion

This lab introduced GeoIP enrichment within the Elastic Stack. By enriching IP addresses with geographical information and visualizing them on Kibana Maps, analysts can quickly detect abnormal login locations and investigate suspicious activity more efficiently. GeoIP is a valuable capability for modern Security Operations Centers (SOC) and threat hunting workflows.

---

# 📚 Key Takeaways

- GeoIP converts IP addresses into geographic information.
- Logstash enriches events before indexing.
- Kibana Maps provides interactive geographic visualization.
- Geographic anomalies can indicate malicious activity.
- GeoIP enrichment strengthens threat hunting investigations.

---
