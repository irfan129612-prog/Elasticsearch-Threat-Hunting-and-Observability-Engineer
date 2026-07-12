#!/bin/bash

# ==============================================
# Lab 40: Exporting & Sharing Dashboards
# Dashboard Management Commands
# ==============================================


echo "Starting Dashboard Export and Sharing Lab"


# ==============================================
# System Information
# ==============================================

echo "Checking Operating System Information"

uname -a


# ==============================================
# Check Running Dashboard Services
# ==============================================

echo "Checking Dashboard Services"


# Grafana Service

systemctl status grafana-server


# Kibana Service

systemctl status kibana


# Metabase (if installed)

ps aux | grep metabase



# ==============================================
# Check Network Ports
# ==============================================

echo "Checking Dashboard Ports"


# Grafana Default Port

ss -tulnp | grep 3000


# Kibana Default Port

ss -tulnp | grep 5601



# ==============================================
# Export Directory Creation
# ==============================================

echo "Creating Dashboard Export Directory"


mkdir -p ~/dashboard_exports


echo "Export Directory Created:"


ls -la ~/dashboard_exports



# ==============================================
# Copy Exported Reports
# ==============================================


echo "Example PDF Export Location"

echo "~/dashboard_exports/dashboard_report.pdf"


echo "Example CSV Export Location"

echo "~/dashboard_exports/dashboard_data.csv"



# ==============================================
# File Permission Check
# ==============================================


echo "Checking Export File Permissions"


ls -lh ~/dashboard_exports



# ==============================================
# Completed
# ==============================================


echo "Dashboard Export and Sharing Lab Completed"