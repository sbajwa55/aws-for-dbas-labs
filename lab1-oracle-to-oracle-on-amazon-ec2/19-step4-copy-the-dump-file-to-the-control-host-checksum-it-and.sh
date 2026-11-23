# AWS for Database Administrators — downloadable lab code
# Lab 1 — Oracle to Oracle on Amazon EC2
# Step 4 — Copy the dump file through S3
# Block: Copy the dump file to the control host, checksum it and upload to S3
# Run on: lenovaonprem2.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

scp oracle@hponprem1.bcs.com:\
/u01/app/oracle/lab_dp/shop.dmp .
sha256sum shop.dmp | tee -a "$LOG"
aws s3 cp shop.dmp "s3://$BUCKET/$LAB/shop.dmp"
