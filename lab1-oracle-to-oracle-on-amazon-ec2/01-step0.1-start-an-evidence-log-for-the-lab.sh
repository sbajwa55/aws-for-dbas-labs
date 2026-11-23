# AWS for Database Administrators — downloadable lab code
# Lab 1 — Oracle to Oracle on Amazon EC2
# Step 0 — Preflight checks
# Step 0.1 — Start an evidence log.
# Block: Start an evidence log for the lab
# Run on: lenovaonprem2.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

export LAB=lab1
mkdir -p "$HOME/aws-dba-lab/$LAB"
cd "$HOME/aws-dba-lab/$LAB"
RUN_ID=$(date -u +%Y%m%dT%H%M%SZ)
export LOG="$PWD/evidence-$RUN_ID.txt"
{ date -u -Is; hostname -f; head -4 /etc/os-release
  aws --version 2>&1; } > "$LOG" 2>&1
chmod 600 "$LOG"
echo "Evidence log: $LOG"
