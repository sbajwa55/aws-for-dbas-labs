# AWS for Database Administrators — downloadable lab code
# Lab 5 — Oracle GoldenGate to AWS
# Step 2 — Build the AWS target
# Step 2.1 — Shared lab resources.
# Block: Create the EC2 instance role, bucket policy and instance profile
# Book: Create the instance role. The bucket policy allows only this lab
#       bucket.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

cat > ec2-trust.json <<'EOF'
{"Version":"2012-10-17","Statement":[{
  "Effect":"Allow",
  "Principal":{"Service":"ec2.amazonaws.com"},
  "Action":"sts:AssumeRole"}]}
EOF
cat > lab-bucket.json <<EOF
{"Version":"2012-10-17","Statement":[{
  "Effect":"Allow",
  "Action":["s3:GetObject","s3:PutObject",
            "s3:ListBucket"],
  "Resource":["arn:aws:s3:::$BUCKET",
              "arn:aws:s3:::$BUCKET/*"]}]}
EOF
aws iam create-role --role-name dba-lab-ec2 \
  --assume-role-policy-document file://ec2-trust.json
aws iam attach-role-policy --role-name dba-lab-ec2 \
  --policy-arn \
  arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore
aws iam put-role-policy --role-name dba-lab-ec2 \
  --policy-name lab-bucket \
  --policy-document file://lab-bucket.json
aws iam create-instance-profile \
  --instance-profile-name dba-lab-ec2
aws iam add-role-to-instance-profile \
  --instance-profile-name dba-lab-ec2 \
  --role-name dba-lab-ec2
