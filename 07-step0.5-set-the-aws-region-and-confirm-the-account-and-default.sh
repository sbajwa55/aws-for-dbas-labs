# AWS for Database Administrators — downloadable lab code
# Lab 4 — PostgreSQL to Oracle on Amazon EC2
# Step 0 — Preflight checks
# Step 0.5 — Confirm the AWS identity and Region.
# Block: Set the AWS Region and confirm the account and default VPC
# Run on: lenovaonprem2.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

export AWS_REGION=us-east-2
export AWS_DEFAULT_REGION=$AWS_REGION
aws sts get-caller-identity \
  --query '{Account:Account,Arn:Arn}' \
  --output table | tee -a "$LOG"
aws ec2 describe-vpcs \
  --filters Name=isDefault,Values=true \
  --query 'Vpcs[].{Vpc:VpcId,Cidr:CidrBlock}' \
  --output table | tee -a "$LOG"
