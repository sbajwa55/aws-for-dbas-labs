# AWS for Database Administrators — downloadable lab code
# Lab 2 — Oracle to MySQL on Amazon RDS
# Cleanup
# Block: Delete the RDS instance, parameter group and RDS security group
# Run on: lenovaonprem2.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

aws rds delete-db-instance \
  --db-instance-identifier dba-lab-mysql \
  --skip-final-snapshot --delete-automated-backups
aws rds wait db-instance-deleted \
  --db-instance-identifier dba-lab-mysql
aws rds delete-db-parameter-group \
  --db-parameter-group-name dba-lab-mysql
aws ec2 delete-security-group --group-id "$SG_RDS"
