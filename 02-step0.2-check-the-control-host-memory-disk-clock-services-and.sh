# AWS for Database Administrators — downloadable lab code
# Lab 4 — PostgreSQL to Oracle on Amazon EC2
# Step 0 — Preflight checks
# Step 0.2 — Check the control host.
# Block: Check the control host: memory, disk, clock, services and tools
# Run on: lenovaonprem2.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

hostname -f
free -h
df -h "$HOME"
timedatectl status | grep -i synchronized
systemctl --failed
aws --version
session-manager-plugin --version
