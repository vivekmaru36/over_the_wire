#!/bin/bash

# i will execute level 1 script and than i will display password for bandi1

# ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If --> password is fetched

set -euo pipefail
echo "Yo i am script2 i will print password for bandi1 using bandit0"

host="bandit.labs.overthewire.org"
port=2220
user="bandit0"
# read -p "Enter the username : " user
# echo "Entered username"

ssh -p "$port" "$user@$host" cat readme 