#!/bin/bash
# will become a file to open file name "-"
# reason whjy you can't open is it takes it as stderr/std out need to specify full path

# password from level 1
# ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If

set -euo pipefail

host="bandit.labs.overthewire.org"
port=2220
user="bandit1"
password="ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If"

echo "Connecting to $host as $user on port $port ...."

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" "echo 'Password for next level from - is: '; cat ./-"
