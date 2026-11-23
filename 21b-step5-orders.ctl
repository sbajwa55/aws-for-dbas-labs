-- AWS for Database Administrators — downloadable lab code
-- Lab 4 — PostgreSQL to Oracle on Amazon EC2
-- Step 5 — Load with SQL*Loader
-- Block: Save the orders control file and load both CSV files with SQL*Loader
-- Book: Use the same two control files as Lab 3 Step 4 (customers.ctl and
--       orders.ctl), saved on lenovaonprem2:
-- Save as orders.ctl
--
-- SQL*Loader control file. Save it under the file name shown, in the
-- directory that holds the CSV files, then run the sqlldr commands from the book.
-- ----------------------------------------------------------------------

LOAD DATA
CHARACTERSET AL32UTF8
INFILE 'orders_ora.csv'
APPEND INTO TABLE shop.orders
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
( order_id, customer_id,
  order_date DATE "YYYY-MM-DD HH24:MI:SS",
  status, total_amount, notes CHAR(4000) )
