# AWS for Database Administrators — downloadable lab code
# Lab 5 — Oracle GoldenGate to AWS
# Step 4 — Instantiate the target at a known SCN
# Block: Copy the dump file to the instance and import it
# Run on: lenovaonprem2, then on the EC2 instance.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

scp oracle@hponprem1.bcs.com:\
/u01/app/oracle/lab_dp/shop_gg.dmp .
aws s3 cp shop_gg.dmp "s3://$BUCKET/$LAB/shop_gg.dmp"
# --- on the EC2 instance ---
BUCKET=<your bucket name>
sudo aws s3 cp "s3://$BUCKET/lab5/shop_gg.dmp" \
  /opt/lab_dp/
sudo chown 54321:54321 /opt/lab_dp/shop_gg.dmp
sudo docker exec -it oracle-free impdp \
  system@//localhost:1521/FREEPDB1 \
  schemas=SHOP directory=LAB_DP \
  dumpfile=shop_gg.dmp logfile=shop_gg_imp.log
