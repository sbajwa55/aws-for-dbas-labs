# AWS for Database Administrators — downloadable lab code
# Lab 1 — Oracle to Oracle on Amazon EC2
# Step 6 — Validate the target
# Block: Validate the target: counts, totals, objects and constraints
# Run on: lenovaonprem2, with the port-forwarding session from Step 2.3 still
# open.
#
# This block switches into a database client (sqlplus, psql, mysql).
# Paste the client command first, then paste the SQL at its prompt.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

sqlplus system@//localhost:15210/FREEPDB1
SELECT COUNT(*), SUM(total_amount),
       MIN(order_date), MAX(order_date)
FROM shop.orders;
SELECT status, COUNT(*), SUM(total_amount)
FROM shop.orders GROUP BY status ORDER BY status;
SELECT COUNT(*) AS customers, SUM(is_active) AS active
FROM shop.customers;
SELECT COUNT(*) AS null_notes
FROM shop.orders WHERE notes IS NULL;
SELECT object_type, status, COUNT(*)
FROM dba_objects WHERE owner = 'SHOP'
GROUP BY object_type, status ORDER BY 1, 2;
SELECT table_name, constraint_type, COUNT(*)
FROM dba_constraints WHERE owner = 'SHOP'
GROUP BY table_name, constraint_type ORDER BY 1, 2;
