-- AWS for Database Administrators — downloadable lab code
-- Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
-- Step 4 — Load into Oracle
-- Block: Save the SQL*Loader control file for customers
-- Book: Create two SQL*Loader control files on lenovaonprem2. customers.ctl:
-- Save as customers.ctl
--
-- SQL*Loader control file. Save it under the file name shown, in the
-- directory that holds the CSV files, then run the sqlldr commands from the book.
-- ----------------------------------------------------------------------

LOAD DATA
CHARACTERSET AL32UTF8
INFILE 'customers.csv'
APPEND INTO TABLE shop.customers
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
( customer_id, full_name, email, city, is_active,
  created_at DATE "YYYY-MM-DD HH24:MI:SS" )
