#!/bin/bash

# There is a git repository at ssh://bandit30-git@localhost/home/bandit30-git/repo via the port 2220. The password for the user bandit30-git is the same as for the user bandit30.

# Clone the repository and find the password for the next level.

host="bandit.labs.overthewire.org"
port=2220
user="bandit31"
password="fb5S2xb7bRyFmAvQYQGEqsbhVyJqhnDy"

sshpass -p "$password" ssh -p $port $user@$host 
