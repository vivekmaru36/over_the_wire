#!/bin/bash

# The password for the next level can be retrieved by submitting the password of the current level to port 30000 on localhost.

host="bandit.labs.overthewire.org"
# port=30000
port=2220
# user="bandit14"
user="bandit14"
password=MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS

echo "Connecting to $host as $user on port $port ...."

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" << 'EOF'

echo "Password for level 15 is : "
echo "MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS" | nc localhost 30000


EOF
# ssh -o StrictHostKeyChecking=no -i /home/bandit13/sshkey.private bandit14@localhost -p 2220