#!/bin/bash

# There is a git repository at ssh://bandit29-git@localhost/home/bandit29-git/repo via the port 2220. The password for the user bandit29-git is the same as for the user bandit29.
# Clone the repository and find the password for the next level.

host="bandit.labs.overthewire.org"
port=2220
user="bandit29"
password="4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7"

sshpass -p "$password" ssh -p $port $user@$host 


## credentials
# - username: bandit30
# - password: qp30ex3VLz5MDG1n91YowTv4Q8l7CDZL
