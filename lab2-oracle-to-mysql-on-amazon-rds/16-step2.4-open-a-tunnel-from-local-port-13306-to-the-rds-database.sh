# AWS for Database Administrators — downloadable lab code
# Lab 2 — Oracle to MySQL on Amazon RDS
# Step 2 — Build the AWS target
# Step 2.4 — Open a tunnel to the database.
# Block: Open a tunnel from local port 13306 to the RDS database
# Run on: lenovaonprem2, in a second terminal (set IID and RDS_HOST there
# too).
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

aws ssm start-session --target "$IID" \
  --document-name \
  AWS-StartPortForwardingSessionToRemoteHost \
  --parameters "{\"host\":[\"$RDS_HOST\"],\
\"portNumber\":[\"3306\"],\"localPortNumber\":[\"13306\"]}"
