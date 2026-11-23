# AWS for Database Administrators — downloadable lab code
# Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
# Cleanup
# Block: Delete the RDS instance, the EC2 instance and both security groups
# Run on: lenovaonprem2.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

aws rds delete-db-instance \
  --db-instance-identifier dba-lab-pg \
  --skip-final-snapshot --delete-automated-backups
aws rds wait db-instance-deleted \
  --db-instance-identifier dba-lab-pg
aws ec2 delete-security-group --group-id "$SG_RDS"
aws ec2 terminate-instances --instance-ids "$IID"
aws ec2 wait instance-terminated --instance-ids "$IID"
aws ec2 delete-security-group --group-id "$SG_EC2"
