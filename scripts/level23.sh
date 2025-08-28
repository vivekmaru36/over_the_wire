#!/bin/bash

# A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

# NOTE: Try connecting to your own network daemon to see if it works as you think

host="bandit.labs.overthewire.org"
port=2220
user="bandit22"
password=tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q

sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host