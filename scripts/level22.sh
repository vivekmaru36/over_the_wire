#!/bin/bash

# A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

# NOTE: Try connecting to your own network daemon to see if it works as you think

host="bandit.labs.overthewire.org"
port=2220
user="bandit21"
password=EeoULMCra2q0dSkYj561DX7s1CpBuOBt

sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host << 'EOF'

cd /etc/cron.d/
cat cronjob_bandit22
cat /usr/bin/cronjob_bandit22.sh

echo "Password for bandit 22 is : "
cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv


EOF

# Password for bandit22
# tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q