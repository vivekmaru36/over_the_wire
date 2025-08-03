#!/bin/bash

# Passowrd from level2 :
# 263JGJPfgU6LtdEvgfWU1XP5yac29mFx

# pr statement : The password for the next level is stored in a file called –spaces in this filename– located in the home directory

set -euo pipefail

host="bandit.labs.overthewire.org"
port=2220
user="bandit2"
password="263JGJPfgU6LtdEvgfWU1XP5yac29mFx"

echo "Connecting to $host as $user on port $port ...."

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" "echo 'Password from file name --spaces\ in\ this\ filename-- is : '; cat < --spaces\ in\ this\ filename--"