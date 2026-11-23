-- AWS for Database Administrators — downloadable lab code
-- Lab 5 — Oracle GoldenGate to AWS
-- Step 1 — Prepare the source database
-- Block: Create the GoldenGate user in the source pluggable database
-- Book: Create the GoldenGate user in the pluggable database:
--
-- Paste these statements at the database prompt (SQL>, mysql> or psql)
-- named in the book, then compare the results with the expected values.
-- ----------------------------------------------------------------------

ALTER SESSION SET CONTAINER = BAJPDB1;
CREATE USER ggadmin IDENTIFIED BY "<LAB_PASSWORD>"
  DEFAULT TABLESPACE users QUOTA 100M ON users;
GRANT CREATE SESSION, RESOURCE TO ggadmin;
GRANT SELECT ANY DICTIONARY, SELECT ANY TABLE,
  FLASHBACK ANY TABLE TO ggadmin;
EXEC DBMS_GOLDENGATE_AUTH.GRANT_ADMIN_PRIVILEGE('GGADMIN')
