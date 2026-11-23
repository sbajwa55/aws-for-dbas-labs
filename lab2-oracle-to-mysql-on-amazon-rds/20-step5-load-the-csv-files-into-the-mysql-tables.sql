-- AWS for Database Administrators — downloadable lab code
-- Lab 2 — Oracle to MySQL on Amazon RDS
-- Step 5 — Load into RDS for MySQL
-- Block: Load the CSV files into the MySQL tables
-- Run in the mysql session on lenovaonprem2, from the directory that holds the
-- CSV files. Load customers first because orders reference them.
--
-- Paste these statements at the database prompt (SQL>, mysql> or psql)
-- named in the book, then compare the results with the expected values.
-- ----------------------------------------------------------------------

USE shop;
LOAD DATA LOCAL INFILE 'customers.csv'
  INTO TABLE customers
  FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
  LINES TERMINATED BY '\n' IGNORE 1 LINES
  (customer_id, full_name, @email, @city,
   is_active, created_at)
  SET email = NULLIF(@email,''),
      city  = NULLIF(@city,'');
LOAD DATA LOCAL INFILE 'orders.csv'
  INTO TABLE orders
  FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
  LINES TERMINATED BY '\n' IGNORE 1 LINES
  (order_id, customer_id, order_date, status,
   total_amount, @notes)
  SET notes = NULLIF(@notes,'');
SHOW WARNINGS LIMIT 10;
