#!/bin/bash

# Level Goal
# There is a git repository at ssh://bandit27-git@localhost/home/bandit27-git/repo via the port 2220. The password for the user bandit27-git is the same as for the user bandit27.
# Clone the repository and find the password for the next level.


host="bandit.labs.overthewire.org"
port=2220
user="bandit27"
password="upsNCc7vzaRDx6oZC6GiR6ERwe1MowGB"

sshpass -p "$password" ssh -p $port $user@$host 

# git clone ssh://bandit27-git@localhost:2220/home/bandit27-git/repo
# cat README

# The password to the next andit 28 level is: Yz9IpL0sBcCeuG7m9uQFt8ZNpS4HZRcN


# sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p $port $user@$host <<'EOF'
#   mkdir -p /tmp/vivek
#   cd /tmp/vivek
#   git -c core.sshCommand="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" \
#       clone ssh://bandit27-git@localhost:2220/home/bandit27-git/repo
#   cd repo
#   ls -la
#   cat README
#   cd ..
#   rm -rf repo
#   rmdir /tmp/vivek
#   echo "Hello World"
# EOF


# even gpt couldn't help so asking on stack overflow on how to automate
# https://stackoverflow.com/staging-ground/79755005