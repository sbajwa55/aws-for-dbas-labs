-- AWS for Database Administrators — downloadable lab code
-- Lab 5 — Oracle GoldenGate to AWS
-- Step 6 — Test ongoing replication
-- Block: Make test changes on the source: insert, update and delete
-- Run on: lenovaonprem2, connected to the source BAJPDB1 as SHOP.
--
-- Paste these statements at the database prompt (SQL>, mysql> or psql)
-- named in the book, then compare the results with the expected values.
-- ----------------------------------------------------------------------

INSERT INTO shop.orders
  (customer_id, order_date, status, total_amount, notes)
VALUES (1, SYSDATE, 'NEW', 99.95, 'GG test');
UPDATE shop.orders SET status = 'SHIPPED'
WHERE order_id = 3;
DELETE FROM shop.orders WHERE order_id = 5000;
COMMIT;
