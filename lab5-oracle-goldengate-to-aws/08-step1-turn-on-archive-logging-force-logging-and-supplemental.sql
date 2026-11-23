-- AWS for Database Administrators — downloadable lab code
-- Lab 5 — Oracle GoldenGate to AWS
-- Step 1 — Prepare the source database
-- Block: Turn on archive logging, force logging and supplemental logging
-- Run on: hponprem1, as SYSDBA in the CDB root.
--
-- Paste these statements at the database prompt (SQL>, mysql> or psql)
-- named in the book, then compare the results with the expected values.
-- ----------------------------------------------------------------------

SHUTDOWN IMMEDIATE
STARTUP MOUNT
ALTER DATABASE ARCHIVELOG;
ALTER DATABASE OPEN;
ALTER PLUGGABLE DATABASE ALL OPEN;
ALTER DATABASE FORCE LOGGING;
ALTER DATABASE ADD SUPPLEMENTAL LOG DATA;
ALTER SYSTEM SET enable_goldengate_replication = TRUE
  SCOPE = BOTH;
ALTER SYSTEM SWITCH LOGFILE;
