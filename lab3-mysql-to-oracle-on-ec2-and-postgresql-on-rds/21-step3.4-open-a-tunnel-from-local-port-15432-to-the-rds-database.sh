# AWS for Database Administrators — downloadable lab code
# Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
# Step 3 — Build the AWS targets
# Step 3.4 — Create RDS for PostgreSQL.
# Block: Open a tunnel from local port 15432 to the RDS database
# Book: In a third terminal, open a tunnel to PostgreSQL (set IID and RDS_HOST
#       there first):
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

aws ssm start-session --target "$IID" \
  --document-name \
  AWS-StartPortForwardingSessionToRemoteHost \
  --parameters "{\"host\":[\"$RDS_HOST\"],\
\"portNumber\":[\"5432\"],\"localPortNumber\":[\"15432\"]}"
