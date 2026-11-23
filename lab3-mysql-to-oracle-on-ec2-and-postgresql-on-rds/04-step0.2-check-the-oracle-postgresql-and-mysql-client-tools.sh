# AWS for Database Administrators — downloadable lab code
# Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
# Step 0 — Preflight checks
# Step 0.2 — Check the control host.
# Block: Check the Oracle, PostgreSQL and MySQL client tools
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

sqlplus -v
sqlldr -help | head -3
psql --version
mysql --version
