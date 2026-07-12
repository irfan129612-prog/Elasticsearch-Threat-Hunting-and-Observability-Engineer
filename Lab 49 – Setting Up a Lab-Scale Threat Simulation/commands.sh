#!/bin/bash

##################################################
# Lab 49 - Setting Up a Lab-Scale Threat Simulation
##################################################

# Check ELK services
sudo systemctl status elasticsearch
sudo systemctl status kibana
sudo systemctl status logstash
sudo systemctl status filebeat

# Monitor authentication logs
sudo tail -f /var/log/auth.log

# Simulate failed SSH login attempts
for i in {1..5}
do
    ssh invaliduser@localhost
done

# Verify indexed logs
curl -X GET "localhost:9200/ssh_access/_search?pretty"

# Check Elasticsearch indices
curl -X GET "localhost:9200/_cat/indices?v"

# Restart services (if required)
sudo systemctl restart logstash
sudo systemctl restart filebeat
sudo systemctl restart elasticsearch
sudo systemctl restart kibana

# Useful KQL Queries (for Kibana)

# Authentication Events
# event.category : authentication

# Failed Logins
# event.outcome : failure

# SSH Process
# process.name : sshd

# Invalid User
# user.name : "invaliduser"