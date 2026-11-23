-- AWS for Database Administrators — downloadable lab code
-- Lab 4 — PostgreSQL to Oracle on Amazon EC2
-- Step 6 — Validate
-- Block: Validate the Oracle target and the recent_orders view
-- Run on: lenovaonprem2, in SQL*Plus.
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
SELECT COUNT(*) FROM shop.recent_orders;
SELECT MIN(order_date), MAX(order_date)
FROM shop.recent_orders;
