-- AWS for Database Administrators — downloadable lab code
-- Lab 2 — Oracle to MySQL on Amazon RDS
-- Step 6 — Validate
-- Block: Validate the MySQL target against the Oracle baseline
-- Run in the mysql session. The shop. prefix works here because the MySQL
-- database is named shop.
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
START TRANSACTION;
INSERT INTO shop.orders (customer_id, order_date,
  status, total_amount)
VALUES (1, NOW(), 'NEW', 1.00);
SELECT MAX(order_id) FROM shop.orders;
ROLLBACK;
