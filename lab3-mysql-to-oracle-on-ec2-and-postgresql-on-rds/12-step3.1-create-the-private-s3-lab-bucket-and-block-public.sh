# AWS for Database Administrators — downloadable lab code
# Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
# Step 3 — Build the AWS targets
# Step 3.1 — Shared lab resources.
# Block: Create the private S3 lab bucket and block public access
# Run on: lenovaonprem2. Reuse: if the bucket and role exist from another lab,
# run the step anyway; the create commands for existing resources fail
# harmlessly, and the variables and the new security group are still set.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

ACCOUNT=$(aws sts get-caller-identity \
  --query Account --output text)
VPC_ID=$(aws ec2 describe-vpcs \
  --filters Name=isDefault,Values=true \
  --query 'Vpcs[0].VpcId' --output text)
export BUCKET=dba-lab-$ACCOUNT-$AWS_REGION
# Private lab bucket. In us-east-1, omit the
# --create-bucket-configuration option.
aws s3api create-bucket --bucket "$BUCKET" \
  --create-bucket-configuration \
  LocationConstraint=$AWS_REGION
aws s3api put-public-access-block \
  --bucket "$BUCKET" \
  --public-access-block-configuration \
  BlockPublicAcls=true,IgnorePublicAcls=true,\
BlockPublicPolicy=true,RestrictPublicBuckets=true
