# AWS for Database Administrators — downloadable lab code
# Lab 4 — PostgreSQL to Oracle on Amazon EC2
# Step 0 — Preflight checks
# Step 0.4 — Check the network path.
# Block: Check name resolution and the PostgreSQL port
# Run on: lenovaonprem2.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

getent hosts lenovaonprem1.bcs.com
nc -vz lenovaonprem1.bcs.com 5432
