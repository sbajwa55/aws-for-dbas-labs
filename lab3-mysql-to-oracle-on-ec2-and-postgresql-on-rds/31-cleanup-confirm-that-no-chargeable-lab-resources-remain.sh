# AWS for Database Administrators — downloadable lab code
# Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
# Cleanup
# Block: Confirm that no chargeable lab resources remain
# Book: Confirm that nothing chargeable is left:
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

aws ec2 describe-instances \
  --filters Name=tag:Project,Values=aws-dba-lab \
  Name=instance-state-name,Values=pending,running,stopped \
  --query 'Reservations[].Instances[].InstanceId' \
  --output text
aws ec2 describe-volumes \
  --filters Name=status,Values=available \
  --query 'Volumes[].VolumeId' --output text
aws rds describe-db-instances \
  --query 'DBInstances[].DBInstanceIdentifier' \
  --output text
aws rds describe-db-snapshots --snapshot-type manual \
  --query 'DBSnapshots[].DBSnapshotIdentifier' \
  --output text
