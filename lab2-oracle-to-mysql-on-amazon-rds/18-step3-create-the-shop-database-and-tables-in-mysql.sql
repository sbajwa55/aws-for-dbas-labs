-- AWS for Database Administrators — downloadable lab code
-- Lab 2 — Oracle to MySQL on Amazon RDS
-- Step 3 — Convert the schema
-- Block: Create the SHOP database and tables in MySQL
-- Run in the mysql session:
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
  is_active   TINYINT(1) NOT NULL DEFAULT 1,
  created_at  DATETIME NOT NULL
              DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT customers_active_ck
    CHECK (is_active IN (0,1))) ENGINE=InnoDB;
CREATE TABLE orders (
  order_id     BIGINT NOT NULL AUTO_INCREMENT
               PRIMARY KEY,
  customer_id  INT NOT NULL,
  order_date   DATETIME NOT NULL,
  status       VARCHAR(12) NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  notes        VARCHAR(400),
  CONSTRAINT orders_status_ck CHECK
    (status IN ('NEW','SHIPPED','CANCELLED')),
  CONSTRAINT orders_cust_fk FOREIGN KEY
    (customer_id) REFERENCES customers (customer_id),
  INDEX orders_cust_ix (customer_id)) ENGINE=InnoDB;
