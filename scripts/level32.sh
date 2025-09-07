#!/bin/bash

# There is a git repository at ssh://bandit31-git@localhost/home/bandit31-git/repo via the port 2220. The password for the user bandit31-git is the same as for the user bandit31.

# Clone the repository and find the password for the next level.

# gpt could'nt figure it out that i can just del gitignore 
# https://david-varghese.medium.com/overthewire-bandit-level-31-level-32-61a5f9728e51

host="bandit.labs.overthewire.org"
port=2220
user="bandit31"
password="fb5S2xb7bRyFmAvQYQGEqsbhVyJqhnDy"

sshpass -p "$password" ssh -p $port $user@$host 


cd /tmp/
mkdir bandit32_v

cd bandit32_v
pwd

git clone ssh://bandit31-git@localhost:2220/home/bandit31-git/repo

cd /repo
ll
cat README.md
# bandit31@bandit:/tmp/bandit32_v/repo$ cat README.md 
# This time your task is to push a file to the remote repository.

# Details:
#     File name: key.txt
#     Content: 'May I come in?'
#     Branch: master

git branch -r

echo "May i come in ?" > key.txt
cat key.txt

cat .gitignore
# bandit31@bandit:/tmp/bandit32_v/repo$ cat .gitignore
# *.txt
rm .gitignore

git add .
git commit -m "add key.txt please del .gitignore"

git remote -v


git push origin master

# remote: Well done! Here is the password for the next level:
# remote: 3O9RfhqyAlVBEZpVb6LYStshZoqoSx5K


# password for bandit32 : 3O9RfhqyAlVBEZpVb6LYStshZoqoSx5K