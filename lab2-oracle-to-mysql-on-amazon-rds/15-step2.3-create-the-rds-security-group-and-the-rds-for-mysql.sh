# AWS for Database Administrators — downloadable lab code
# Lab 2 — Oracle to MySQL on Amazon RDS
# Step 2 — Build the AWS target
# Step 2.3 — Create the RDS for MySQL instance.
# Block: Create the RDS security group and the RDS for MySQL instance
# Run on: lenovaonprem2. The security group admits port 3306 only from the
# jump host's security group.
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
  --port 3306 --source-group "$SG_EC2"
echo "SG_RDS=$SG_RDS" | tee -a "$LOG"
aws rds create-db-instance \
  --db-instance-identifier dba-lab-mysql \
  --engine mysql \
  --db-instance-class db.t4g.micro \
  --allocated-storage 20 --storage-type gp3 \
  --master-username labadmin \
  --manage-master-user-password \
  --vpc-security-group-ids "$SG_RDS" \
  --no-publicly-accessible --no-multi-az \
  --storage-encrypted --backup-retention-period 1 \
  --tags Key=Project,Value=aws-dba-lab
aws rds wait db-instance-available \
  --db-instance-identifier dba-lab-mysql
read RDS_HOST RDS_VER SECRET_ARN <<< "$(
  aws rds describe-db-instances \
  --db-instance-identifier dba-lab-mysql \
  --query 'DBInstances[0].[Endpoint.Address,
    EngineVersion,MasterUserSecret.SecretArn]' \
  --output text)"
echo "$RDS_HOST $RDS_VER" | tee -a "$LOG"
