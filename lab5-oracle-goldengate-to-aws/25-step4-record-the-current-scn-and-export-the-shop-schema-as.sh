# AWS for Database Administrators — downloadable lab code
# Lab 5 — Oracle GoldenGate to AWS
# Step 4 — Instantiate the target at a known SCN
# Block: Record the current SCN and export the SHOP schema as of that SCN
# Run on: hponprem1. Record the current SCN, then export as of that SCN.
#
# This block switches into a database client (sqlplus, psql, mysql).
# Paste the client command first, then paste the SQL at its prompt.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

sqlplus / as sysdba
-- SQL*Plus:
SELECT current_scn FROM v$database;
EXIT
mkdir -p /u01/app/oracle/lab_dp
expdp system@//hponprem1.bcs.com:1521/BAJPDB1 \
  schemas=SHOP directory=LAB_DP \
  dumpfile=shop_gg.dmp logfile=shop_gg_exp.log \
  flashback_scn=<SCN>
