# AWS for Database Administrators — downloadable lab code
# Lab 2 — Oracle to MySQL on Amazon RDS
# Step 0 — Preflight checks
# Step 0.3 — Check the source database.
# Block: Check the listener, pluggable databases and character set
# Run on: hponprem1, as the Oracle software owner.
#
# This block switches into a database client (sqlplus, psql, mysql).
# Paste the client command first, then paste the SQL at its prompt.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

lsnrctl status
sqlplus / as sysdba
-- SQL*Plus:
SELECT name, open_mode FROM v$pdbs ORDER BY name;
SELECT value FROM nls_database_parameters
WHERE parameter = 'NLS_CHARACTERSET';
EXIT
