#!/bin/bash

# FireCon - Firewall Detection and Recon Script
# Author: Artemis O. Solomon
# Description: Detection and Recon
# Version: 1.0

# VARIABLES
  FIREWALL_IPS=''
  NETWORK_RANGE=''
  LOG_FILE='firewall_detection.log'

# Function to log messages to the log file
  log()
    {
      local messages="$1"
      echo "$(date + '%Y-%m-%d %H:%M:%S') - $message" >> "$LOG_FILE"
    }
# Initialize log file
  echo "---- FIREWALL DETECTION LOG ----" > "$LOG_FILE"

# Prompt the user to input firewall IP addresses
  read -p "Enter the firewall IP addresses (comma-seperated): " FIREWALL_IPS

# Prompt the user if they want to input network ranges
  read -p "Do you want to input network ranges (yes/no)? " input-ranges

  if [ "$input_ranges" == "yes" ]; then
  
# Prompt the user if they want to input network ranges manually or from a txt file
  read -p "Do you want to input network ranges manually or from a txt file (manual/txt)? " input_method
  
  if [ "$input_method" == "manual" ]; then

# Prompt the user to input the network range manually
  read -p "Enter Network Range (CIDR format): " NETWORK_RANGE

  elif [ "$input_range" == "txt" ]; then

# Prompt the user to input a file path for network ranges
  read -p "Enter the path to a text file containing network ranges (one per line): " range_file

  if [ -f "$range_file" ]; then

# Read network ranges from the file and store them in the NETWORK_RANGE variable
  NETWORK_RANGE=$(cat "$range_file")

  else
    log "Error: The specified file '$range_file' does not exist. "
    echo "Error: The Specified file '$range_file' does not exist. "
    exit 1
  fi

  else
    log "Error: Invalid input method. Exiting"
    echo "Error: Invalid input method. Exiting"
    exit 1
  fi
fi

# DETECTING IP TABLES
  if ! iptables -L -v -n; then
    log "Error: Failed to run 'iptables -L -v -n'."
    echo "Error: Failed to run 'iptables -L -v -n'."
  fi

# DETECTING IP TABLES VERSION
  if ! iptables -V; then
    log "Error: Failed to run 'iptables -V'."
    echo "Error: Failed to run 'iptables -V'."
  fi

# DETECTING FIREWALL IP ADDRESSES
  if [ -n "$NETWORK_RANGE" ]; then
  if ! nmap -sV -O -Pn $NETWORK_RANGE > ~/firewall_data.txt; then
    log "Error: Failed to run 'nmap' to detect firewall data."
    echo "Erro: Failed to run 'nmap' to detect firewall data."
  else
    cat ~/firewall_data.txt | grep -i --color firewall; then
    log "Warning: Could not find mentions of 'firewall' in the data."
    echo "Warning: Could not find mentions of 'firewall' in the data."
  fi
fi

# The End
    log "Script execution completed."
    echo "Script execution completed."
  
