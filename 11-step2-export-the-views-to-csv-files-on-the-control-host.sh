# AWS for Database Administrators — downloadable lab code
# Lab 4 — PostgreSQL to Oracle on Amazon EC2
# Step 2 — Export the data for Oracle
# Block: Export the views to CSV files on the control host
# Run on: lenovaonprem2. Connect to the source and write the files on the
# control host with \copy:
#
# This block switches into a database client (sqlplus, psql, mysql).
# Paste the client command first, then paste the SQL at its prompt.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

psql "host=lenovaonprem1.bcs.com dbname=labsrc \
user=postgres"
-- psql:
\copy (SELECT * FROM shop.customers_ora) TO 'customers.csv' CSV
\copy (SELECT * FROM shop.orders_ora) TO 'orders_ora.csv' CSV
\q
wc -l customers.csv orders_ora.csv
head -3 orders_ora.csv
