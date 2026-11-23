-- AWS for Database Administrators — downloadable lab code
-- Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
-- Step 1 — Create the sample schema in MySQL
-- Block: Record the MySQL source baseline
-- Book: Record the source baseline:
--
-- Paste these statements at the database prompt (SQL>, mysql> or psql)
-- named in the book, then compare the results with the expected values.
-- ----------------------------------------------------------------------

SELECT COUNT(*), SUM(total_amount),
       MIN(order_date), MAX(order_date)
FROM shop.orders;
SELECT status, COUNT(*), SUM(total_amount)
FROM shop.orders GROUP BY status ORDER BY status;
SELECT COUNT(*) AS customers, SUM(is_active) AS active
FROM shop.customers;
SELECT COUNT(*) AS null_notes
FROM shop.orders WHERE notes IS NULL;
SELECT COUNT(*) FROM shop.orders WHERE notes = '';
