# AWS for Database Administrators — downloadable lab code
# Lab 1 — Oracle to Oracle on Amazon EC2
# Step 0 — Preflight checks
# Step 0.4 — Check the network path from the control host.
# Block: Check the network path from the control host to the source database
# Run on: lenovaonprem2.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

getent hosts hponprem1.bcs.com
nc -vz hponprem1.bcs.com 1521
ssh -o ConnectTimeout=5 oracle@hponprem1.bcs.com \
  'hostname -f; df -h /u01'
sqlplus -v
