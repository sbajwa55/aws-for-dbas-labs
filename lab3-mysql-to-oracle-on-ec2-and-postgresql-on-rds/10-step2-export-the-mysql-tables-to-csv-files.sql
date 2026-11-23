-- AWS for Database Administrators — downloadable lab code
-- Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
-- Step 2 — Export the data
-- Block: Export the MySQL tables to CSV files
-- Run on: lenovaonprem1, in the mysql session. Write one orders file that
-- keeps NULLs distinct for PostgreSQL, and one that turns NULLs into empty
-- fields for Oracle. NULL is written as \N; empty strings are written as "".
--
-- Paste these statements at the database prompt (SQL>, mysql> or psql)
-- named in the book, then compare the results with the expected values.
-- ----------------------------------------------------------------------

SELECT customer_id, full_name, email, city,
       is_active, created_at
FROM shop.customers ORDER BY customer_id
INTO OUTFILE '/var/lib/mysql-files/customers.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';
SELECT order_id, customer_id, order_date, status,
       total_amount, notes
FROM shop.orders ORDER BY order_id
INTO OUTFILE '/var/lib/mysql-files/orders_pg.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';
SELECT order_id, customer_id, order_date, status,
       total_amount, COALESCE(notes,'')
FROM shop.orders ORDER BY order_id
INTO OUTFILE '/var/lib/mysql-files/orders_ora.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';
