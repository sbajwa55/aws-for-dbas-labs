# AWS for Database Administrators — downloadable lab code
# Lab 5 — Oracle GoldenGate to AWS
# Step 0 — Preflight checks
# Step 0.4 — Check the GoldenGate hub.
# Block: Check the GoldenGate hub: processes, ports and tools
# Run on: lenovaonprem1.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

ps -ef | grep -i '[g]oldengate'
ss -lnt | grep -E ':(7809|7810) '
nc -vz hponprem1.bcs.com 1521
aws --version
session-manager-plugin --version
