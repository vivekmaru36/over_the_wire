#!/bin/bash

# Pr Statement : The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.



set -eou pipefail

password="4CKMh1JI91bUIZZPXDqGanal4xvAg0JM" # password from level9
host="bandit.labs.overthewire.org"
port=2220
user="bandit9"

echo "Connecting to $host as $user on port $port ...."

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" 
