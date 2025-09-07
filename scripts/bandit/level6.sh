#!/bin/bash

# password from level5.sh :
# password="4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw"

# PR statement : The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:
# human-readable
# 1033 bytes in size
# not executabl

set -euo pipefail

host="bandit.labs.overthewire.org"
port=2220
user="bandit5"
password="4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw"

echo "Connecting to $host as $user on port $port ...."

# sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" 

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" "echo 'password for bandit6 is : '; cat \$(find ./inhere/ -type f -size 1033c ! -executable)"



# solution my approach  :
# bandit5@bandit:~$ find ./inhere/ -type f -size 1033c
# ./inhere/maybehere07/.file2