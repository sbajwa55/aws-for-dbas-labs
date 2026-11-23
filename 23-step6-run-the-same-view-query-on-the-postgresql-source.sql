-- AWS for Database Administrators — downloadable lab code
-- Lab 4 — PostgreSQL to Oracle on Amazon EC2
-- Step 6 — Validate
-- Block: Run the same view query on the PostgreSQL source
-- Book: Run the same view queries on the source in psql:
--
-- Paste these statements at the database prompt (SQL>, mysql> or psql)
-- named in the book, then compare the results with the expected values.
-- ----------------------------------------------------------------------

SELECT count(*), min(order_date), max(order_date)
FROM shop.recent_orders;
