# AWS for Database Administrators — downloadable lab code
# Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
# Step 2 — Export the data
# Block: Copy the CSV files to the control host and count their lines
# Run on: lenovaonprem2.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

ssh lenovaonprem1.bcs.com \
  'sudo cat /var/lib/mysql-files/customers.csv' \
  > customers.csv
ssh lenovaonprem1.bcs.com \
  'sudo cat /var/lib/mysql-files/orders_pg.csv' \
  > orders_pg.csv
ssh lenovaonprem1.bcs.com \
  'sudo cat /var/lib/mysql-files/orders_ora.csv' \
  > orders_ora.csv
wc -l *.csv
