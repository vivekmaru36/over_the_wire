#!/bin/bash

# The password for the next level is stored in the file data.txt, which contains base64 encoded data

set -eou pipefail

password="FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey" # password from level9
host="bandit.labs.overthewire.org"
port=2220
user="bandit10"

echo "Connecting to $host as $user on port $port ...."

# sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" 
sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host"
