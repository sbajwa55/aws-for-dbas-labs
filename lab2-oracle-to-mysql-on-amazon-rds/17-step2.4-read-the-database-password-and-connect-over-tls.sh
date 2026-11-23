# AWS for Database Administrators — downloadable lab code
# Lab 2 — Oracle to MySQL on Amazon RDS
# Step 2 — Build the AWS target
# Step 2.4 — Open a tunnel to the database.
# Block: Read the database password and connect over TLS
# Book: In the first terminal, read the password from Secrets Manager and
#       connect:
#
# This block switches into a database client (sqlplus, psql, mysql).
# Paste the client command first, then paste the SQL at its prompt.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

aws secretsmanager get-secret-value \
  --secret-id "$SECRET_ARN" \
  --query SecretString --output text | jq -r .password
mysql -h 127.0.0.1 -P 13306 -u labadmin -p \
  --ssl-mode=REQUIRED --local-infile=1
-- mysql:
SELECT VERSION(), @@local_infile;
