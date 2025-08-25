#!/bin/bash

# To gain access to the next level, you should use the setuid binary in the homedirectory. Execute it without arguments to find out how to use it. The password for this level can be found in the usual place (/etc/bandit_pass), after you have used the setuid binary.

host="bandit.labs.overthewire.org"
port=2220
user="bandit19"
password=cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8

password20=$(sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host \ ./bandit20-do cat /etc/bandit_pass/bandit20)

echo "Password for bandit20 : $password20"