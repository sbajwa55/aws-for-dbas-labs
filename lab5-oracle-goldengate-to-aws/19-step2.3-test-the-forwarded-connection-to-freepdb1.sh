# AWS for Database Administrators — downloadable lab code
# Lab 5 — Oracle GoldenGate to AWS
# Step 2 — Build the AWS target
# Step 2.3 — Start Oracle AI Database Free on the instance.
# Block: Test the forwarded connection to FREEPDB1
# Book: In your first terminal, test the path:
#
# This block switches into a database client (sqlplus, psql, mysql).
# Paste the client command first, then paste the SQL at its prompt.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

nc -vz localhost 15210
sqlplus system@//localhost:15210/FREEPDB1
-- SQL*Plus:
SELECT sys_context('USERENV','CON_NAME') FROM dual;
EXIT
