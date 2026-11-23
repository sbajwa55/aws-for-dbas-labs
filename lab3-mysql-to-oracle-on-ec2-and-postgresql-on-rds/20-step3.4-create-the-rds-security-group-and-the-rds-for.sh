# AWS for Database Administrators — downloadable lab code
# Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
# Step 3 — Build the AWS targets
# Step 3.4 — Create RDS for PostgreSQL.
# Block: Create the RDS security group and the RDS for PostgreSQL instance
# Run on: lenovaonprem2.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

SG_RDS=$(aws ec2 create-security-group \
  --group-name dba-lab-rds-$LAB --vpc-id "$VPC_ID" \
  --description "DBA lab RDS - from lab EC2 only" \
  --query GroupId --output text)
aws ec2 authorize-security-group-ingress \
  --group-id "$SG_RDS" --protocol tcp \
  --port 5432 --source-group "$SG_EC2"
echo "SG_RDS=$SG_RDS" | tee -a "$LOG"
aws rds create-db-instance \
  --db-instance-identifier dba-lab-pg \
  --engine postgres --db-name labdb \
  --db-instance-class db.t4g.micro \
  --allocated-storage 20 --storage-type gp3 \
  --master-username labadmin \
  --manage-master-user-password \
  --vpc-security-group-ids "$SG_RDS" \
  --no-publicly-accessible --no-multi-az \
  --storage-encrypted --backup-retention-period 1 \
  --tags Key=Project,Value=aws-dba-lab
aws rds wait db-instance-available \
  --db-instance-identifier dba-lab-pg
read RDS_HOST RDS_VER SECRET_ARN <<< "$(
  aws rds describe-db-instances \
  --db-instance-identifier dba-lab-pg \
  --query 'DBInstances[0].[Endpoint.Address,
    EngineVersion,MasterUserSecret.SecretArn]' \
  --output text)"
echo "$RDS_HOST $RDS_VER" | tee -a "$LOG"
