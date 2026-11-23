# AWS for Database Administrators — downloadable lab code
# Lab 4 — PostgreSQL to Oracle on Amazon EC2
# Cleanup
# Block: Remove the shared lab bucket and instance role
# Book: If no other lab is still using them, remove the shared bucket and
#       instance role:
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

aws s3 rm "s3://$BUCKET" --recursive
aws s3api delete-bucket --bucket "$BUCKET"
aws iam remove-role-from-instance-profile \
  --instance-profile-name dba-lab-ec2 \
  --role-name dba-lab-ec2
aws iam delete-instance-profile \
  --instance-profile-name dba-lab-ec2
aws iam delete-role-policy --role-name dba-lab-ec2 \
  --policy-name lab-bucket
aws iam detach-role-policy --role-name dba-lab-ec2 \
  --policy-arn \
  arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore
aws iam delete-role --role-name dba-lab-ec2
