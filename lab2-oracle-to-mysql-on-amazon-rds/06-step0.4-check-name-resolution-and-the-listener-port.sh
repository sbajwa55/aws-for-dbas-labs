# AWS for Database Administrators — downloadable lab code
# Lab 2 — Oracle to MySQL on Amazon RDS
# Step 0 — Preflight checks
# Step 0.4 — Check the network path.
# Block: Check name resolution and the listener port
# Run on: lenovaonprem2.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

getent hosts hponprem1.bcs.com
nc -vz hponprem1.bcs.com 1521
