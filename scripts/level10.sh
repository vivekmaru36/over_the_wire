#!/bin/bash

# Pr Statement : The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.

set -eou pipefail

password="4CKMh1JI91bUIZZPXDqGanal4xvAg0JM" # password from level9
host="bandit.labs.overthewire.org"
port=2220
user="bandit9"

echo "Connecting to $host as $user on port $port ...."

# sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" 
# sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" "echo 'Passwrd for bandit 9 is : ';cat data.txt | base64 | grep ="

# my approach this is wrong you have to find from the file not convert it to b64
# cat data.txt | base64 | grep =
# L47Vsnxp1QuQ+GTzdwLebq0hho1rGVpNOShRzjIaYsoAEPEJr1UY455UPCsSHO4L5+7IaqUCk6c=

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" \
'strings data.txt | grep "===="'
# FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey