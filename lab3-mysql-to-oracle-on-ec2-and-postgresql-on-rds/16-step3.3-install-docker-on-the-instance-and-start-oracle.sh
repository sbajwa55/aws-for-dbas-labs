# AWS for Database Administrators — downloadable lab code
# Lab 3 — MySQL to Oracle on EC2 and PostgreSQL on RDS
# Step 3 — Build the AWS targets
# Step 3.3 — Start Oracle AI Database Free on the instance.
# Block: Install Docker on the instance and start Oracle Database Free
# Book: Open a shell on the instance through Session Manager. The commands
#       after the comment line run on the EC2 instance.
#
# Paste these commands into a terminal a few lines at a time and check each
# result against the book. Do not run this file as one script.
# ----------------------------------------------------------------------

aws ssm start-session --target "$IID"
# --- on the EC2 instance ---
sudo dnf install -y docker
sudo systemctl enable --now docker
sudo mkdir -p /opt/lab_dp
sudo chown 54321:54321 /opt/lab_dp
read -rsp "Choose SYS/SYSTEM password: " ORACLE_PWD; echo
sudo docker run -d --name oracle-free \
  -p 127.0.0.1:1521:1521 \
  -e ORACLE_PWD="$ORACLE_PWD" \
  -v oracle-data:/opt/oracle/oradata \
  -v /opt/lab_dp:/opt/lab_dp \
  container-registry.oracle.com/database/free:latest
unset ORACLE_PWD
sudo docker logs -f oracle-free
