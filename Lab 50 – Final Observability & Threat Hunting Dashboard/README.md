# Lab 50 – Final Observability & Threat Hunting Dashboard

## Lab Overview

This lab demonstrates the creation of a complete Security Operations Center (SOC) observability and threat hunting dashboard using open-source monitoring and security tools.

The purpose of this lab is to integrate different data sources including security logs, system performance metrics, and network traffic data into a centralized dashboard.

The final dashboard provides a Single Pane of Glass view for SOC analysts to monitor, investigate, and respond to security events.

---

# Objectives

- Understand the fundamentals of observability and threat hunting.
- Collect and analyze security logs from Linux systems.
- Monitor CPU, memory, disk, and system performance.
- Collect network traffic and communication data.
- Configure ELK Stack for centralized monitoring.
- Create a SOC dashboard for security visibility.

---

# Lab Architecture

                 Linux Host
                     |
        --------------------------------
        |              |               |
    Filebeat      Metricbeat      Packetbeat
    Logs          Metrics         Network Data
        |              |               |
        --------------------------------
                     |
                 Logstash
                     |
              Elasticsearch
                     |
                  Kibana
                     |
        SOC Observability Dashboard


---

# Tools Used

## Filebeat

Purpose:
- Collects log data from Linux systems.
- Sends authentication and system logs to Elasticsearch.

Examples:
- SSH login attempts
- Authentication failures
- System logs


## Metricbeat

Purpose:
- Collects system performance metrics.

Monitors:
- CPU usage
- Memory utilization
- Disk usage
- System load


## Packetbeat

Purpose:
- Collects network traffic information.

Monitors:
- Network connections
- Protocol activity
- Source and destination communication


## Elasticsearch

Purpose:
- Stores and indexes collected data.
- Provides fast searching and analysis.


## Logstash

Purpose:
- Processes incoming data.
- Filters and transforms logs before storing them.


## Kibana

Purpose:
- Creates dashboards and visualizations.
- Provides security monitoring interface.


---

# Task 1: Setup Data Sources and Collectors


## Install Filebeat

Update system packages:

sudo apt update


Install Filebeat:

sudo apt install filebeat -y


Enable Filebeat:

sudo systemctl enable filebeat


Start Filebeat:

sudo systemctl start filebeat


Check status:

sudo systemctl status filebeat



## Configure Filebeat

Edit configuration:

sudo nano /etc/filebeat/filebeat.yml


Example configuration:

filebeat.inputs:

- type: log
  enabled: true
  paths:
    - /var/log/*.log


Test configuration:

sudo filebeat test config


Restart service:

sudo systemctl restart filebeat



---

# Install Metricbeat


Install:

sudo apt install metricbeat -y


Enable system module:

sudo metricbeat modules enable system


Setup Metricbeat:

sudo metricbeat setup


Start service:

sudo systemctl start metricbeat


Enable startup:

sudo systemctl enable metricbeat



---

# Install Packetbeat


Install:

sudo apt install packetbeat -y


Configure:

sudo nano /etc/packetbeat/packetbeat.yml


Enable network flow monitoring:


packetbeat.protocols:

- type: flow
  enabled: true
  period: 10s


Setup:

sudo packetbeat setup


Start service:

sudo systemctl start packetbeat


Enable startup:

sudo systemctl enable packetbeat



---

# Task 2: Configure ELK Stack


# Elasticsearch Setup


Install Elasticsearch:

sudo apt install elasticsearch -y


Start Elasticsearch:

sudo systemctl start elasticsearch


Enable Elasticsearch:

sudo systemctl enable elasticsearch


Verify:

curl localhost:9200


Expected output:

Elasticsearch cluster information should be displayed.



---

# Logstash Setup


Install Logstash:

sudo apt install logstash -y


Create pipeline:

sudo nano /etc/logstash/conf.d/beats.conf


Configuration:


input {

 beats {

 port => 5044

 }

}


output {

 elasticsearch {

 hosts => ["localhost:9200"]

 }

}



Start Logstash:

sudo systemctl start logstash


Enable Logstash:

sudo systemctl enable logstash



---

# Kibana Setup


Install Kibana:

sudo apt install kibana -y


Start Kibana:

sudo systemctl start kibana


Enable Kibana:

sudo systemctl enable kibana


Access Kibana:


http://SERVER-IP:5601



---

# Task 3: Dashboard Creation


## Security Alerts Dashboard


Data Source:

Filebeat


Visualizations:

- Failed login attempts
- SSH authentication failures
- User activity
- Suspicious events



## CPU and Memory Monitoring


Data Source:

Metricbeat


Visualizations:

- CPU usage percentage
- Memory utilization
- Disk usage
- System load



## Network Monitoring


Data Source:

Packetbeat


Visualizations:

- Network traffic
- Source IP addresses
- Destination IP addresses
- Top communicating hosts



---

# Threat Hunting Features


## Event Timeline

Displays security events in chronological order.

Useful for:

- Incident investigation
- Attack timeline analysis
- User activity tracking



## Top Talkers

Identifies the most active systems in the network.

Useful for:

- Finding abnormal communication
- Detecting suspicious hosts
- Monitoring bandwidth usage



---

# Dashboard Validation


Verify all services:


systemctl status filebeat

systemctl status metricbeat

systemctl status packetbeat

systemctl status elasticsearch

systemctl status logstash

systemctl status kibana



Check Elasticsearch indices:


curl localhost:9200/_cat/indices?v



Check logs:


journalctl -u filebeat -f



---

# SOC Use Cases


This dashboard helps Security Operations teams to:


- Detect brute-force attacks.
- Monitor authentication failures.
- Identify suspicious network activity.
- Analyze system performance issues.
- Perform threat hunting investigations.
- Maintain centralized security visibility.



---

# Final Result


After completing this lab:

✔ Security logs collected successfully.  
✔ System metrics monitored.  
✔ Network visibility achieved.  
✔ ELK Stack configured.  
✔ SOC monitoring dashboard created.  
✔ Threat hunting environment prepared.  


---

# Conclusion


The Final Observability & Threat Hunting Dashboard provides a centralized monitoring solution for SOC environments.

By combining Filebeat, Metricbeat, Packetbeat, Logstash, Elasticsearch, and Kibana, security analysts can monitor infrastructure health, detect threats, and investigate security incidents from a single dashboard interface.
