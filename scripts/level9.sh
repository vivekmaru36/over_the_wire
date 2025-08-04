#!/bin/bash

# PR statement : 
# The password for the next level is stored in the file data.txt and is the only line of text that occurs only once

set -eou pipefail

password="dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc"
host="bandit.labs.overthewire.org"
port=2220
user="bandit8"
password="dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc"  # from level8.sh

echo "Connecting to $host as $user on port $port ...."

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" "echo 'Password for bandit9 is :'; cat data.txt | sort | uniq -u"