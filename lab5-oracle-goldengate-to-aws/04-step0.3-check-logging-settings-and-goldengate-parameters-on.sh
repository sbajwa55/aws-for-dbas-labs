# AWS for Database Administrators — downloadable lab code
# Lab 5 — Oracle GoldenGate to AWS
# Step 0 — Preflight checks
# Step 0.3 — Check the source database.
# Block: Check logging settings and GoldenGate parameters on the source
# Run on: hponprem1, as the Oracle software owner.
#
# This block switches into a database client (sqlplus, psql, mysql).
# Paste the client command first, then paste the SQL at its prompt.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

sqlplus / as sysdba
-- SQL*Plus (CDB root):
SELECT name, log_mode, force_logging,
       supplemental_log_data_min FROM v$database;
SELECT name, open_mode FROM v$pdbs ORDER BY name;
SHOW PARAMETER enable_goldengate_replication
SHOW PARAMETER streams_pool_size
EXIT
