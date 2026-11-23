# AWS for Database Administrators — downloadable lab code
# Lab 1 — Oracle to Oracle on Amazon EC2
# Step 5 — Import into Oracle on EC2
# Block: Import the SHOP schema into FREEPDB1
# Run on: the EC2 instance.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

sudo docker exec -it oracle-free impdp \
  system@//localhost:1521/FREEPDB1 \
  schemas=SHOP directory=LAB_DP \
  dumpfile=shop.dmp logfile=shop_imp.log
