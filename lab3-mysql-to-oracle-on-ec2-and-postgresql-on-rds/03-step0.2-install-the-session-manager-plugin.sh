# AWS for Database Administrators — downloadable lab code
# Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
# Step 0 — Preflight checks
# Step 0.2 — Check the control host.
# Block: Install the Session Manager plugin
# Book: If session-manager-plugin is missing, install the plugin that AWS
#       publishes for 64-bit x86 Linux:
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

sudo dnf install -y https://s3.amazonaws.com/\
session-manager-downloads/plugin/latest/\
linux_64bit/session-manager-plugin.rpm
