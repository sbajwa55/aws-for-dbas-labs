# AWS for Database Administrators — downloadable lab code
# Lab 1 — Oracle to Oracle on Amazon EC2
# Step 4 — Copy the dump file through S3
# Block: Download the dump file on the instance and verify its checksum
# Run on: the EC2 instance (Session Manager shell).
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

BUCKET=<your bucket name from Step 2.1>
sudo aws s3 cp "s3://$BUCKET/lab1/shop.dmp" /opt/lab_dp/
sudo chown 54321:54321 /opt/lab_dp/shop.dmp
sha256sum /opt/lab_dp/shop.dmp
