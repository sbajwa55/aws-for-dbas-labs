# AWS for Database Administrators — downloadable lab code
# Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
# Step 3 — Build the AWS targets
# Step 3.1 — Shared lab resources.
# Block: Create a security group with no inbound rules
# Book: Create a security group with no inbound rules. You will reach the
#       instance through Session Manager, so no SSH or database port is opened
#       to the internet.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

SG_EC2=$(aws ec2 create-security-group \
  --group-name dba-lab-ec2-$LAB --vpc-id "$VPC_ID" \
  --description "DBA lab EC2 - no inbound rules" \
  --query GroupId --output text)
echo "SG_EC2=$SG_EC2" | tee -a "$LOG"
