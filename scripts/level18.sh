#!/bin/bash

# There are 2 files in the homedirectory: passwords.old and passwords.new. The password for the next level is in passwords.new and is the only line that has been changed between passwords.old and passwords.new

# NOTE: if you have solved this level and see ‘Byebye!’ when trying to log into bandit18, this is related to the next level, bandit19

host="bandit.labs.overthewire.org"
port=2220
# user="bandit17"
user="bandit17"
# password="kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx" // .bandit16.password it seems wrong


# sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host"
# /mnt/c/Users/pc/Music/Vivek_Code/Projects/over_the_wire/scripts

# please get pk key from level18 and storte localy and save it as 600 or 400 to use
# ssh -i ~/Pk_17.key $user@$host -p 2220 

ssh -i ~/Pk_17.key $user@$host -p 2220 << 'EOF'

echo Password for bandit 18 is :
diff passwords.old passwords.new | grep '^>'
# x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO
EOF

# sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" 