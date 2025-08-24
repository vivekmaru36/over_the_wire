#!/bin/bash

# There is a setuid binary in the homedirectory that does the following: it makes a connection to localhost on the port you specify as a commandline argument. It then reads a line of text from the connection and compares it to the password in the previous level (bandit20). If the password is correct, it will transmit the password for the next level (bandit21).

# NOTE: Try connecting to your own network daemon to see if it works as you think

host="bandit.labs.overthewire.org"
port=2220
user="bandit19"
password=cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8

sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host << 'EOF'

# run nmap scan on local host and give a port number that don't have any service ruinning on it 
# ss- tlnp
# 4242 was not in nmap -p0-9999 localhost you can also use ss -tlnp to check the port used port numbers pick anythiong not in ss -tlnp

# nc -l -p 4242 # than run nc -l -p <empty port without a service>     # -l listening -p port 

# open another terminal and run the banditto do script by specifing the port that you started to listen using nc

# use tmux to open a another terminal and please use sleep to put the nc in background 

# start listener in background
echo "cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8" | nc -l -p 4242 &
# give it a second to start
sleep 1
# connect with setuid binary
./bandit20-do nc localhost 4242

EOF