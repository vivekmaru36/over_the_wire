#!/bin/bash

# The password for the next level is stored in a file readme in the homedirectory. Unfortunately, someone has modified .bashrc to log you out when you log in with SSH.
host="bandit.labs.overthewire.org"
port=2220
# user="bandit17"
user="bandit18"
password=x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO

sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host 

# byebye when loggining into it ? what does it mean ?
# sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host -4 
# sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host -A
# sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host -A
# sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host -X

# never knew i can also write changes to bashrc of a remote server without logging into it 



