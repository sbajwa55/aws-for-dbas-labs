-- AWS for Database Administrators — downloadable lab code
-- Lab 5 — Oracle GoldenGate to AWS
-- Step 6 — Test ongoing replication
-- Block: Confirm the test changes arrived on the target
-- Book: On the target (lenovaonprem2, through a tunnel to port 1521 on the
--       instance):
--
-- Paste these statements at the database prompt (SQL>, mysql> or psql)
-- named in the book, then compare the results with the expected values.
-- ----------------------------------------------------------------------

SELECT COUNT(*) FROM shop.orders;
SELECT order_id, status, notes FROM shop.orders
WHERE notes = 'GG test' OR order_id IN (3, 5000);
SELECT city FROM shop.customers
WHERE customer_id = 2;
