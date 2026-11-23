# AWS for Database Administrators — downloadable lab code
# Lab 5 — Oracle GoldenGate to AWS
# Step 2 — Build the AWS target
# Step 2.4 — Prepare the target for Replicat.
# Block: Prepare the target database and user for Replicat
# Run on: the EC2 instance.
#
# This block switches into a database client (sqlplus, psql, mysql).
# Paste the client command first, then paste the SQL at its prompt.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

sudo docker exec -it oracle-free sqlplus / as sysdba
-- SQL*Plus (CDB root):
ALTER SYSTEM SET enable_goldengate_replication = TRUE
  SCOPE = BOTH;
ALTER SESSION SET CONTAINER = FREEPDB1;
CREATE USER ggadmin IDENTIFIED BY "<LAB_PASSWORD>"
  DEFAULT TABLESPACE users QUOTA 100M ON users;
GRANT CREATE SESSION, CREATE TABLE TO ggadmin;
GRANT OGG_APPLY TO ggadmin;
EXIT
