#! /bin/bash

# This scripts scans for given open port in a given network.

echo "Enter your network address (e.g. '192.168.xxx.0/24'):"
read network_address

echo "Enter the port you want to scan for:"
read port

# Use nmap to scan network range for the given port. Output is saved
# in grepable format into file 'scan_output'.
nmap -sT $network_address -p $port >/dev/null -oG scan_output

# Use grep to filter for results where the given port is open.
cat scan_output | grep open > filtered_scan_output

# Output final results.
cat filtered_scan_output