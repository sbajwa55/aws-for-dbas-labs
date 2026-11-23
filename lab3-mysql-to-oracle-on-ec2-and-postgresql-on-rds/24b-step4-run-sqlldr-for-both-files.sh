# AWS for Database Administrators — downloadable lab code
# Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
# Step 4 — Load into Oracle
# Block: Save the orders control file and load both CSV files with SQL*Loader
# Book: orders.ctl:
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

sqlldr userid=system@//localhost:15210/FREEPDB1 \
  control=customers.ctl log=customers.log
sqlldr userid=system@//localhost:15210/FREEPDB1 \
  control=orders.ctl log=orders.log
grep -E 'Rows? (successfully|not)' customers.log orders.log
