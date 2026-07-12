#!/bin/bash

# Lab 31: APM Fundamentals
# Elastic APM Setup Commands


echo "Updating system packages..."

sudo apt-get update


# Install Node.js and npm

echo "Installing Node.js and npm..."

sudo apt-get install nodejs npm -y


# Install Python dependencies

echo "Installing Python pip..."

sudo apt-get install python3-pip -y


# Install Elastic APM Python Agent

echo "Installing Elastic APM Python Agent..."

pip3 install elastic-apm


# Install Elastic APM Node.js Agent

echo "Installing Elastic APM Node.js Agent..."

npm install elastic-apm-node --save


# Install Docker (for APM Server if required)

echo "Installing Docker..."

sudo apt-get install docker.io -y


sudo systemctl start docker
sudo systemctl enable docker


# Run Elastic APM Server Container

echo "Starting Elastic APM Server..."

docker run -d \
--name apm-server \
-p 8200:8200 \
docker.elastic.co/apm/apm-server:8.8.0


# Check APM Server

echo "Checking APM Server..."

curl http://localhost:8200


# Generate Application Traffic Example

echo "Generating test traffic..."

curl http://localhost:3000/


echo "APM Fundamentals Lab Setup Completed"

echo "Kibana APM:"
echo "http://localhost:5601"

echo "APM Server:"
echo "http://localhost:8200"