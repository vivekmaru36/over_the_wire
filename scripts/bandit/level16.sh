#!/bin/bash

# The password for the next level can be retrieved by submitting the password of the current level to port 30001 on localhost using SSL/TLS encryption.

# Helpful note: Getting “DONE”, “RENEGOTIATING” or “KEYUPDATE”? Read the “CONNECTED COMMANDS” section in the manpage.

host="bandit.labs.overthewire.org"
# port=30000
port=2220
# user="bandit14"
user="bandit15"
password=8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo

echo "Connecting to $host as $user on port $port ...."

# sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host"
sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" << 'EOF'

echo "Passowrd to be sent over openssl is : 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo"

# echo "8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo" | openssl s_client -connect localhost:30001 2>/dev/null

echo '8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo' | openssl s_client -connect localhost:30001 -quiet

EOF

# openssl s_client -connect localhost:30001
# than enter password make sre to wait for the handshhake to happen first opr you will interrupt it

# password give over ssl for bandit 16 is : kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx