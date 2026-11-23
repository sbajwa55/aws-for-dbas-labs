# AWS for Database Administrators — downloadable lab code
# Lab 2 — Oracle to MySQL on Amazon RDS
# Troubleshooting
# Block: Turn on local_infile with a custom parameter group
# Book: If LOAD DATA reports that loading local data is disabled, the server's
#       local_infile setting is off. Create a parameter group for your engine
#       family (for example mysql8.4), set local_infile to 1, attach it, and
#       reboot:
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

aws rds create-db-parameter-group \
  --db-parameter-group-name dba-lab-mysql \
  --db-parameter-group-family mysql8.4 \
  --description "DBA lab"
aws rds modify-db-parameter-group \
  --db-parameter-group-name dba-lab-mysql \
  --parameters "ParameterName=local_infile,\
ParameterValue=1,ApplyMethod=immediate"
aws rds modify-db-instance \
  --db-instance-identifier dba-lab-mysql \
  --db-parameter-group-name dba-lab-mysql \
  --apply-immediately
aws rds reboot-db-instance \
  --db-instance-identifier dba-lab-mysql
