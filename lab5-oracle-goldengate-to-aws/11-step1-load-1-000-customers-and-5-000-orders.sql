-- AWS for Database Administrators — downloadable lab code
-- Lab 5 — Oracle GoldenGate to AWS
-- Step 1 — Prepare the source database
-- Block: Load 1,000 customers and 5,000 orders
-- Book: Load 1,000 customers and 5,000 orders. The values are generated from
--       the row number, so every reader gets the same totals.
--
-- Paste these statements at the database prompt (SQL>, mysql> or psql)
-- named in the book, then compare the results with the expected values.
-- ----------------------------------------------------------------------

INSERT INTO shop.customers
  (full_name, email, city, is_active, created_at)
SELECT 'Customer '||LEVEL,
       'cust'||LEVEL||'@example.com',
       CASE MOD(LEVEL,4) WHEN 0 THEN 'Philadelphia'
         WHEN 1 THEN 'Pittsburgh' WHEN 2 THEN 'Wayne'
         ELSE 'Erie' END,
       CASE WHEN MOD(LEVEL,10) = 0 THEN 0 ELSE 1 END,
       DATE '2025-01-01'
         + NUMTODSINTERVAL(LEVEL*37,'MINUTE')
FROM dual CONNECT BY LEVEL <= 1000;
INSERT INTO shop.orders
  (customer_id, order_date, status, total_amount, notes)
SELECT MOD(LEVEL-1,1000)+1,
       DATE '2025-01-01'
         + NUMTODSINTERVAL(LEVEL*11,'MINUTE'),
       CASE MOD(LEVEL,3) WHEN 0 THEN 'NEW'
         WHEN 1 THEN 'SHIPPED' ELSE 'CANCELLED' END,
       ROUND(10 + MOD(LEVEL*7919,50000)/100, 2),
       CASE WHEN MOD(LEVEL,5) = 0 THEN 'Gift wrap'
            WHEN MOD(LEVEL,7) = 0 THEN '' END
FROM dual CONNECT BY LEVEL <= 5000;
COMMIT;
EXEC DBMS_STATS.GATHER_SCHEMA_STATS('SHOP')
