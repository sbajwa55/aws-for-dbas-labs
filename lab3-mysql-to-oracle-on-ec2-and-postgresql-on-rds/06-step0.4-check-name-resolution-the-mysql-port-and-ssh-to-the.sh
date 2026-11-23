# AWS for Database Administrators — downloadable lab code
# Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
# Step 0 — Preflight checks
# Step 0.4 — Check the network path.
# Block: Check name resolution, the MySQL port and SSH to the source host
# Run on: lenovaonprem2.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

getent hosts lenovaonprem1.bcs.com
nc -vz lenovaonprem1.bcs.com 3306
ssh -o ConnectTimeout=5 lenovaonprem1.bcs.com 'hostname -f'
