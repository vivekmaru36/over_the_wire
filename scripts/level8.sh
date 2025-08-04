#!/bin/bash

# PR statement :
# The password for the next level is stored in the file data.txt next to the word millionth

set -euo pipefail

host="bandit.labs.overthewire.org"
port=2220
user="bandit7"
password="morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj"  # from level7.sh

echo "Connecting to $host as $user on port $port ...."

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" "echo 'Passwrd for bandit 8 is : ';cat data.txt | grep millionth"
# sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host"