# AWS for Database Administrators — downloadable lab code
# Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
# Step 0 — Preflight checks
# Step 0.3 — Check the source database.
# Block: Check the source MySQL server, port and file directory
# Run on: lenovaonprem1.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

mysql --version
sudo systemctl status mysqld --no-pager
ss -lnt | grep ':3306 '
mysql -u root -p -e "SELECT VERSION();
  SHOW VARIABLES LIKE 'secure_file_priv';"
