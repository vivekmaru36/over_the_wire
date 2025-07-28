#!/bin/bash
#i will be script to ssh to bandit.labs.overthewire.org using port 2220 using password bandit0 anmd username bandit0

# my code
# HOST="bandit.labs.overthewire.org"
# PORT=2220
# USER="bandit0"
# echo "connecting to bandit.labs.overthewire.org using bandit0"
# # echo "enter password for bandit0 : "
# # read -s 
# ssh -p $PORT $USER@$HOST

# refined by ai
# good stuff best practices
set -euo pipefail

host="bandit.labs.overthewire.org"
port=2220
user="bandit0"  #default value for username
# now reading username to use this for every level
read -p "Enter the username : " user
echo "Entered username is : $user"


echo "Checking Environemts ...."

# check if ssh exists
if ! command -v ssh >/dev/null 2>&1; then # any output or error are discarded to null using 2 for std err and 1 for std out
    echo "Error : ssh command not fonund install openssh first"
    exit 1
fi

# check if host is reachable  the ping commmand is block beacause icmp ping is blocked by banditlabs
# if ! ping -c 1 -W 3 "$host" >/dev/null 2>&1; then # -c sends 1 packet and -w only waits for 3 seconds to repond
#     echo "Erro Cannot reach host; check your network"
#     exit 1
# fi

# check if port 2220 is open
if ! nc -z "$host" "$port" >/dev/null 2>&1; then    # just scans for open port don't send data using z nc-->netcat\
    echo "Error: Port $port on $host is not reachable."
    exit 1
fi 

echo "connecting to $host as $user on port $port ...."

ssh -p "$port" "$user@$host"