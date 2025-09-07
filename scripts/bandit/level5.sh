#!/bin/bash

# password from level4.sh :
# password="2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ"

# Pr Statement : The password for the next level is stored in the only human-readable file in the inhere directory. Tip: if your terminal is messed up, try the “reset” command.

set -euo pipefail

host="bandit.labs.overthewire.org"
port=2220
user="bandit4"
password="2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ"

echo "Connecting to $host as $user on port $port ...."

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" "echo 'Password from a file  -file07 : '; cat inhere/-file07"

# solution there are total of 9 files only file07 is in human readable format