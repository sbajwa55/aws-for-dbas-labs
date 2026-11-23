-- AWS for Database Administrators — downloadable lab code
-- Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
-- Step 1 — Create the sample schema in MySQL
-- Block: Create and load the SHOP database in MySQL
-- Run on: lenovaonprem1, in a mysql session as an administrative user. Notice
-- the MySQL-specific types.
--
-- Paste these statements at the database prompt (SQL>, mysql> or psql)
-- named in the book, then compare the results with the expected values.
-- ----------------------------------------------------------------------

CREATE DATABASE shop CHARACTER SET utf8mb4;
USE shop;
CREATE TABLE customers (
  customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  full_name   VARCHAR(100) NOT NULL,
  email       VARCHAR(150),
  city        VARCHAR(60),
  is_active   BOOLEAN NOT NULL DEFAULT TRUE,
  created_at  DATETIME NOT NULL
              DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE orders (
  order_id     BIGINT NOT NULL AUTO_INCREMENT
               PRIMARY KEY,
  customer_id  INT NOT NULL,
  order_date   DATETIME NOT NULL,
  status       ENUM('NEW','SHIPPED','CANCELLED')
               NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  notes        TEXT,
  FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id));
SET SESSION cte_max_recursion_depth = 10000;
INSERT INTO customers
  (full_name, email, city, is_active, created_at)
WITH RECURSIVE seq (n) AS
  (SELECT 1 UNION ALL SELECT n + 1 FROM seq
   WHERE n < 1000)
SELECT CONCAT('Customer ', n),
       CONCAT('cust', n, '@example.com'),
       ELT(MOD(n,4)+1, 'Philadelphia','Pittsburgh',
           'Wayne','Erie'),
       IF(MOD(n,10) = 0, 0, 1),
       TIMESTAMP('2025-01-01') + INTERVAL n*37 MINUTE
FROM seq;
INSERT INTO orders
  (customer_id, order_date, status, total_amount, notes)
WITH RECURSIVE seq (n) AS
  (SELECT 1 UNION ALL SELECT n + 1 FROM seq
   WHERE n < 5000)
SELECT MOD(n-1,1000)+1,
       TIMESTAMP('2025-01-01') + INTERVAL n*11 MINUTE,
       ELT(MOD(n,3)+1, 'NEW','SHIPPED','CANCELLED'),
       ROUND(10 + MOD(n*7919,50000)/100, 2),
       CASE WHEN MOD(n,5) = 0 THEN 'Gift wrap'
            WHEN MOD(n,7) = 0 THEN '' END
FROM seq;
