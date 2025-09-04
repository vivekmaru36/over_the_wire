#!/bin/bash


# There is a git repository at ssh://bandit28-git@localhost/home/bandit28-git/repo via the port 2220. The password for the user bandit28-git is the same as for the user bandit28.
# Clone the repository and find the password for the next level.

host="bandit.labs.overthewire.org"
port=2220
user="bandit28"
password="Yz9IpL0sBcCeuG7m9uQFt8ZNpS4HZRcN"


sshpass -p "$password" ssh -p $port $user@$host 

# cd /tmp
# mkdir cock
# cd cock
# git clone ssh://bandit28-git@localhost:2220/home/bandit28-git/repo
# cd repo
# cat README.md
# git show

#  - username: bandit29
# -- password: 4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7
