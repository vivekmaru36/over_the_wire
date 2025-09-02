#!/bin/bash

# Level Goal
# There is a git repository at ssh://bandit27-git@localhost/home/bandit27-git/repo via the port 2220. The password for the user bandit27-git is the same as for the user bandit27.
# Clone the repository and find the password for the next level.

host="bandit.labs.overthewire.org"
port=2220
user="bandit27"
password="upsNCc7vzaRDx6oZC6GiR6ERwe1MowGB"

sshpass -p "$password" ssh -p $port $user@$host