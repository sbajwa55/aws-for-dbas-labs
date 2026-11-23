-- AWS for Database Administrators — downloadable lab code
-- Lab 2 — Oracle to MySQL on Amazon RDS
-- Step 4 — Export the data from Oracle as CSV
-- Block: Save the SQL*Plus script that exports the tables to CSV files
-- Run on: lenovaonprem2. Save this script as export_shop.sql:
--
-- Ready-made script: copy this file to your working directory on
-- lenovaonprem2 as export_shop.sql (or rename it), then run the commands
-- in the next file.
-- ----------------------------------------------------------------------

SET MARKUP CSV ON QUOTE ON
SET TERMOUT OFF FEEDBACK OFF HEADING ON
SET PAGESIZE 50000 LINESIZE 32767 TRIMSPOOL ON
ALTER SESSION SET NLS_DATE_FORMAT =
  'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.,';
SPOOL customers.csv
SELECT customer_id, full_name, email, city,
       is_active, created_at
FROM shop.customers ORDER BY customer_id;
SPOOL OFF
SPOOL orders.csv
SELECT order_id, customer_id, order_date, status,
       total_amount, notes
FROM shop.orders ORDER BY order_id;
SPOOL OFF
EXIT
