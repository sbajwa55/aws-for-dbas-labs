# AWS for Database Administrators — downloadable lab code
# Lab 5 — Oracle GoldenGate to AWS
# Step 2 — Build the AWS target
# Step 2.5 — Start the tunnel on the GoldenGate hub.
# Block: Open the database tunnel from the GoldenGate hub
# Run on: lenovaonprem1, with AWS credentials for the lab account, in a
# terminal that stays open.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

export AWS_REGION=us-east-2
IID=<instance ID from Step 2.2>
aws ssm start-session --target "$IID" \
  --document-name AWS-StartPortForwardingSession \
  --parameters \
  '{"portNumber":["1521"],"localPortNumber":["15210"]}'
