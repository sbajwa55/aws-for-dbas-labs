# AWS for Database Administrators — downloadable lab code
# Lab 2 — Oracle to MySQL on Amazon RDS
# Step 2 — Build the AWS target
# Step 2.1 — Shared lab resources.
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
