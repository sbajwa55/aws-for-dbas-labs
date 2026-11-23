-- AWS for Database Administrators — downloadable lab code
-- Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
-- Step 5 — Load into PostgreSQL
-- Block: Validate the PostgreSQL target
-- Book: Validate. PostgreSQL cannot sum a boolean, so change SUM(is_active) to
--       SUM(is_active::int) in the customers query:
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
SELECT count(*) FROM shop.orders WHERE notes = '';
