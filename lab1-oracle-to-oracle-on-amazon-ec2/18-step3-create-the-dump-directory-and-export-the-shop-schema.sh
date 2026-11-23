# AWS for Database Administrators — downloadable lab code
# Lab 1 — Oracle to Oracle on Amazon EC2
# Step 3 — Export the source schema
# Block: Create the dump directory and export the SHOP schema
# Run on: hponprem1, as the Oracle software owner. Create a directory for the
# dump file and a matching directory object in the pluggable database.
#
# This block switches into a database client (sqlplus, psql, mysql).
# Paste the client command first, then paste the SQL at its prompt.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

mkdir -p /u01/app/oracle/lab_dp
sqlplus / as sysdba
-- SQL*Plus:
ALTER SESSION SET CONTAINER = BAJPDB1;
CREATE OR REPLACE DIRECTORY lab_dp
  AS '/u01/app/oracle/lab_dp';
EXIT
expdp system@//hponprem1.bcs.com:1521/BAJPDB1 \
  schemas=SHOP directory=LAB_DP \
  dumpfile=shop.dmp logfile=shop_exp.log \
  flashback_time=systimestamp
