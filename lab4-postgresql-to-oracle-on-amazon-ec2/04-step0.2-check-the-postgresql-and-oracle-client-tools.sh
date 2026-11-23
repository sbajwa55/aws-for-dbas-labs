# AWS for Database Administrators — downloadable lab code
# Lab 4 — PostgreSQL to Oracle on Amazon EC2
# Step 0 — Preflight checks
# Step 0.2 — Check the control host.
# Block: Check the PostgreSQL and Oracle client tools
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

psql --version
sqlplus -v
sqlldr -help | head -3
