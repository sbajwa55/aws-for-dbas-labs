# AWS for Database Administrators — downloadable lab code
# Lab 1 — Oracle to Oracle on Amazon EC2
# Step 0 — Preflight checks
# Step 0.3 — Check the source database.
# Block: Check the source Oracle instance, listener and database version
# Run on: hponprem1, as the Oracle software owner.
#
# This block switches into a database client (sqlplus, psql, mysql).
# Paste the client command first, then paste the SQL at its prompt.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

ps -ef | grep '[p]mon'
lsnrctl status
sqlplus / as sysdba
-- SQL*Plus:
SELECT name, open_mode FROM v$pdbs ORDER BY name;
SELECT name, log_mode FROM v$database;
SELECT banner_full FROM v$version;
EXIT
