-- AWS for Database Administrators — downloadable lab code
-- Lab 5 — Oracle GoldenGate to AWS
-- Step 4 — Instantiate the target at a known SCN
-- Block: Change a row on the source while the export runs
-- Book: If the LAB_DP directory object does not exist, create it as shown in
--       Lab 1 Step 3. While the export runs, make a change on the source so
--       that you can see Replicat apply a change that the export does not
--       contain:
--
-- Paste these statements at the database prompt (SQL>, mysql> or psql)
-- named in the book, then compare the results with the expected values.
-- ----------------------------------------------------------------------

UPDATE shop.customers SET city = 'Erie'
WHERE customer_id = 2;
COMMIT;
