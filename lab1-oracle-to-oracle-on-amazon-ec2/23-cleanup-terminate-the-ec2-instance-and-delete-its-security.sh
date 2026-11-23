# AWS for Database Administrators — downloadable lab code
# Lab 1 — Oracle to Oracle on Amazon EC2
# Cleanup
# Block: Terminate the EC2 instance and delete its security group
# Run on: lenovaonprem2. Stop the port-forwarding session with Ctrl+C, then
# remove the lab resources.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

aws ec2 terminate-instances --instance-ids "$IID"
aws ec2 wait instance-terminated --instance-ids "$IID"
aws ec2 delete-security-group --group-id "$SG_EC2"
