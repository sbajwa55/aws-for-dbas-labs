# AWS for Database Administrators — downloadable lab code
# Lab 4 — PostgreSQL to Oracle on Amazon EC2
# Step 0 — Preflight checks
# Step 0.3 — Check the source database.
# Block: Check the source PostgreSQL service, port, version and encoding
# Run on: lenovaonprem1.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

systemctl list-unit-files | grep -i postgres
sudo systemctl status postgresql-17 --no-pager
ss -lnt | grep ':5432 '
sudo -iu postgres psql -c 'SELECT version();'
sudo -iu postgres psql -c 'SHOW server_encoding;'
