#!/bin/bash

# There is a git repository at ssh://bandit30-git@localhost/home/bandit30-git/repo via the port 2220. The password for the user bandit30-git is the same as for the user bandit30.

# Clone the repository and find the password for the next level.

host="bandit.labs.overthewire.org"
port=2220
user="bandit30"
password="qp30ex3VLz5MDG1n91YowTv4Q8l7CDZL"

sshpass -p "$password" ssh -p $port $user@$host 

cd /tmp/
mkdir bandit31_v

cd bandit31_v
pwd

git clone ssh://bandit30-git@localhost:2220/home/bandit30-git/repo

cd /repo
ll
cat README.md
git branch -r

git checkout origin/master
ll
git tag
git show secret 
# fb5S2xb7bRyFmAvQYQGEqsbhVyJqhnDy


rm -rf /tmp/bandit31_v/
