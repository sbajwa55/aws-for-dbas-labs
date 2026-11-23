# AWS for Database Administrators — downloadable lab code
# Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
# Step 3 — Build the AWS targets
# Step 3.3 — Start Oracle AI Database Free on the instance.
# Block: Forward local port 15210 to the database on the instance
# Book: Open a second terminal on your control host and start a port-
#       forwarding session. Leave it running while you work; local port 15210
#       now leads to the Oracle listener on the instance.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

aws ssm start-session --target "$IID" \
  --document-name AWS-StartPortForwardingSession \
  --parameters \
  '{"portNumber":["1521"],"localPortNumber":["15210"]}'
