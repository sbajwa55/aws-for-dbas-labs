-- AWS for Database Administrators — downloadable lab code
-- Lab 4 — PostgreSQL to Oracle on Amazon EC2
-- Step 2 — Export the data for Oracle
-- Block: Create views that format the data for Oracle
-- Run on: lenovaonprem1, as the postgres user in psql connected to labsrc. Two
-- export views format each value for Oracle: booleans as 1 or 0, timestamps in
-- a fixed format, and NULL notes as empty strings, because Oracle treats both
-- as NULL.
--
-- Paste these statements at the database prompt (SQL>, mysql> or psql)
-- named in the book, then compare the results with the expected values.
-- ----------------------------------------------------------------------

CREATE VIEW shop.customers_ora AS
SELECT customer_id, full_name, email, city,
       CASE WHEN is_active THEN 1 ELSE 0 END,
       to_char(created_at, 'YYYY-MM-DD HH24:MI:SS')
FROM shop.customers ORDER BY customer_id;
CREATE VIEW shop.orders_ora AS
SELECT order_id, customer_id,
       to_char(order_date, 'YYYY-MM-DD HH24:MI:SS'),
       status, total_amount, COALESCE(notes, '')
FROM shop.orders ORDER BY order_id;
