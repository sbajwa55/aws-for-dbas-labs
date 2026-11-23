# AWS for Database Administrators — downloadable lab code
# Lab 5 — Oracle GoldenGate to AWS
# Step 2 — Build the AWS target
# Step 2.2 — Launch the EC2 instance.
# Block: Launch the EC2 instance and wait until Session Manager sees it
# Run on: lenovaonprem2.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

P=/aws/service/ami-amazon-linux-latest
AMI=$(aws ssm get-parameter --name \
  $P/al2023-ami-kernel-default-x86_64 \
  --query Parameter.Value --output text)
cat > bdm.json <<'EOF'
[{"DeviceName":"/dev/xvda",
  "Ebs":{"VolumeSize":40,"VolumeType":"gp3",
         "Encrypted":true,"DeleteOnTermination":true}}]
EOF
cat > tags.json <<EOF
[{"ResourceType":"instance","Tags":[
  {"Key":"Name","Value":"dba-lab-$LAB"},
  {"Key":"Project","Value":"aws-dba-lab"}]}]
EOF
sleep 15   # let a new instance profile propagate
IID=$(aws ec2 run-instances --image-id "$AMI" \
  --instance-type t3.large --count 1 \
  --iam-instance-profile Name=dba-lab-ec2 \
  --security-group-ids "$SG_EC2" \
  --metadata-options HttpTokens=required \
  --block-device-mappings file://bdm.json \
  --tag-specifications file://tags.json \
  --query 'Instances[0].InstanceId' --output text)
echo "IID=$IID" | tee -a "$LOG"
aws ec2 wait instance-status-ok --instance-ids "$IID"
aws ssm describe-instance-information \
  --filters Key=InstanceIds,Values="$IID" \
  --query 'InstanceInformationList[].PingStatus' \
  --output text
