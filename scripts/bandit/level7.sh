# !/bin/bash

# password from level6.sh for bandit6 : HWasnPhtq9AVKe0dmk45nxy20cvUa6EG

# Problem statement : The password for the next level is stored somewhere on the server and has all of the following properties:
# owned by user bandit7
# owned by group bandit6
# 33 bytes in size

set -euo pipefail

host="bandit.labs.overthewire.org"
port=2220
user="bandit6"
password="HWasnPhtq9AVKe0dmk45nxy20cvUa6EG"

echo "Connecting to $host as $user on port $port ...."

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" "echo 'password for bandit7 is : '; cat \$(find / -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null)"  

# my approach :
# find / -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null

# soultion is to supresss std err '2' to /dev/null to avoid permission denied file giving errors
# find / -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null