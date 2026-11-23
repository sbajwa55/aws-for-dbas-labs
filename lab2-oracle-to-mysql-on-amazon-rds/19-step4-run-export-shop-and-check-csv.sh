# AWS for Database Administrators — downloadable lab code
# Lab 2 — Oracle to MySQL on Amazon RDS
# Step 4 — Export the data from Oracle as CSV
# Block: Save the SQL*Plus script that exports the tables to CSV files
# Run on: lenovaonprem2. Save this script as export_shop.sql:
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

sqlplus shop@//hponprem1.bcs.com:1521/BAJPDB1 \
  @export_shop.sql
wc -l customers.csv orders.csv
head -3 orders.csv
