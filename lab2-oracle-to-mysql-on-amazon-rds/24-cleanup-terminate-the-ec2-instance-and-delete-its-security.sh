# AWS for Database Administrators — downloadable lab code
# Lab 2 — Oracle to MySQL on Amazon RDS
# Cleanup
# Block: Terminate the EC2 instance and delete its security group
# Book: The parameter-group command fails harmlessly if you did not create
#       one. If deleting the security group reports a dependency, wait a
#       minute for RDS to release its network interface and try again. Delete
#       the RDS security group before the EC2 one, because its rule refers to
#       the EC2 group.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

aws ec2 terminate-instances --instance-ids "$IID"
aws ec2 wait instance-terminated --instance-ids "$IID"
aws ec2 delete-security-group --group-id "$SG_EC2"
