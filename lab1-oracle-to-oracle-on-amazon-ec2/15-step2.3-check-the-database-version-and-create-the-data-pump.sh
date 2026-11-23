# AWS for Database Administrators — downloadable lab code
# Lab 1 — Oracle to Oracle on Amazon EC2
# Step 2 — Build the AWS target
# Step 2.3 — Start Oracle AI Database Free on the instance.
# Block: Check the database version and create the Data Pump directory
# Book: Wait until the log shows DATABASE IS READY TO USE!, then press Ctrl+C
#       to stop following the log. The first start can take several minutes.
#       Then check the database and create a Data Pump directory in the
#       FREEPDB1 pluggable database:
#
# This block switches into a database client (sqlplus, psql, mysql).
# Paste the client command first, then paste the SQL at its prompt.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

sudo docker exec -it oracle-free sqlplus / as sysdba
-- SQL*Plus (inside the container):
SELECT banner_full FROM v$version;
SHOW PDBS
ALTER SESSION SET CONTAINER = FREEPDB1;
CREATE OR REPLACE DIRECTORY lab_dp AS '/opt/lab_dp';
EXIT
