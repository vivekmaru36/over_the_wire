#!/bin/bash

host="bandit.labs.overthewire.org"
port=2220
user="bandit19"
password=cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8
# user="bandit20"
# password=0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO

# =========================new approach
# since every pass is stored in etc/bandit_pass but restriceted due to setuiid of that user itself so when you want to give it as input just give it rather than trying to store and such | below approach to give restricted file as input without reading


password20=$(sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host \ ./bandit20-do cat /etc/bandit_pass/bandit20) #0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO

echo "Password for bandit20 : $password20"
user2="bandit20"

sshpass -p $password20 ssh -o StrictHostKeyChecking=no -p $port $user2@$host << 'EOF'

# find a free port
ss -tuln | grep 2343

# you can use screen it seems easy comparesd to tmux hate screens  # cries in pain when can't control tmux movements wish i could do it so doing it in single script format

# Terminal 1 --> listening terminal
# Start the listener on port 2343 with the password of bandit20
# tmux 
# echo "0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO" | nc -l -p 2343
# cat /etc/bandit_pass/bandit20 | nc -l -p 2343 & # run the listener in background using &


# Terminal 2 --> sending terminal is this 
# password_21=$(./suconnect 2343)

# echo "Password for level 21 is : $password_21"

# now way i couldn't figure this out
password_21=$( (cat /etc/bandit_pass/bandit20 | nc -l -p 2343) & ./suconnect 2343 >/dev/null )
echo "Password for level 21 is : $password_21"
EOF

# ---------------------------------------------
# # There is a setuid binary in the homedirectory that does the following: it makes a connection to localhost on the port you specify as a commandline argument. It then reads a line of text from the connection and compares it to the password in the previous level (bandit20). If the password is correct, it will transmit the password for the next level (bandit21).

# NOTE: Try connecting to your own network daemon to see if it works as you think

# # find a free port
# ss -tuln | grep 2343

# # you can use screen it seems easy comparesd to tmux hate screens

# # Terminal 1 --> listening terminal
# # Start the listener on port 2343 with the password of bandit20
# echo "0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO" | nc -l -p 2343 

# # Terminal 2 --> sending terminal is this 
# ./suconnect 2343


# bandit20@bandit:~$ ./suconnect 2343
# Read: 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO
# Password matches, sending next password
# --------------------------------------------------- crash shit

# wow i forget level 19-> 20 

# ======================================= experimienting
# sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host << 'EOF'

# # run nmap scan on local host and give a port number that don't have any service ruinning on it 
# # ss- tlnp
# # 4242 was not in nmap -p0-9999 localhost you can also use ss -tlnp to check the port used port numbers pick anythiong not in ss -tlnp

# # nc -l -p 4242 # than run nc -l -p <empty port without a service>     # -l listening -p port 

# # open another terminal and run the banditto do script by specifing the port that you started to listen using nc

# # use tmux to open a another terminal and please use sleep to put the nc in background 

# # start listener in background
# echo "cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8" | nc -l -p 4242 &
# # give it a second to start
# sleep 1
# # connect with setuid binary
# ./bandit20-do nc localhost 4242

# EOF