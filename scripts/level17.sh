#!/bin/bash


# The credentials for the next level can be retrieved by submitting the password of the current level to a port on localhost in the range 31000 to 32000. First find out which of these ports have a server listening on them. Then find out which of those speak SSL/TLS and which don’t. There is only 1 server that will give the next credentials, the others will simply send back to you whatever you send to it.

# Helpful note: Getting “DONE”, “RENEGOTIATING” or “KEYUPDATE”? Read the “CONNECTED COMMANDS” section in the manpage


host="bandit.labs.overthewire.org"
# port=30000
port=2220
# user="bandit14"
user="bandit16"
password=kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host"
# sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" << 'EOF'

passtosend=$(cat .bandit15.password)
echo $passtosend

ports=$(nmap -p31000-32000 localhost | grep open | awk '{print $1}' | cut -d/ -f1)
echo $ports

for n in $ports ;

do 
echo "The following port is being checked : "$n
echo "$passtosend"  openssl s_client -connect localhost:$n -quiet

done

logout

EOF

# the output of nmap -sV -p31000-32000 this command takes too much time cause it also scans services and versions with respect to that port

# bandit16@bandit:~$ nmap -sV -p31000-32000 localhost
# Starting Nmap 7.94SVN ( https://nmap.org ) at 2025-08-19 13:55 UTC
# Nmap scan report for localhost (127.0.0.1)
# Host is up (0.00014s latency).
# Not shown: 996 closed tcp ports (conn-refused)
# PORT      STATE SERVICE     VERSION
# 31046/tcp open  echo
# 31518/tcp open  ssl/echo
# 31691/tcp open  echo
# 31790/tcp open  ssl/unknown
# 31960/tcp open  echo
# 1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
# SF-Port31790-TCP:V=7.94SVN%T=SSL%I=7%D=8/19%Time=68A4826F%P=x86_64-pc-linu
# SF:x-gnu%r(GenericLines,32,"Wrong!\x20Please\x20enter\x20the\x20correct\x2
# SF:0current\x20password\.\n")%r(GetRequest,32,"Wrong!\x20Please\x20enter\x
# SF:20the\x20correct\x20current\x20password\.\n")%r(HTTPOptions,32,"Wrong!\
# SF:x20Please\x20enter\x20the\x20correct\x20current\x20password\.\n")%r(RTS
# SF:PRequest,32,"Wrong!\x20Please\x20enter\x20the\x20correct\x20current\x20
# SF:password\.\n")%r(Help,32,"Wrong!\x20Please\x20enter\x20the\x20correct\x
# SF:20current\x20password\.\n")%r(FourOhFourRequest,32,"Wrong!\x20Please\x2
# SF:0enter\x20the\x20correct\x20current\x20password\.\n")%r(LPDString,32,"W
# SF:rong!\x20Please\x20enter\x20the\x20correct\x20current\x20password\.\n")
# SF:%r(SIPOptions,32,"Wrong!\x20Please\x20enter\x20the\x20correct\x20curren
# SF:t\x20password\.\n");

# Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done: 1 IP address (1 host up) scanned in 163.32 second

# --------------
# you can use without -sV you will have to listen each port with giving password to each cause you don't know which service is ruynning on it 

# nmap -p31000-32000



openssl s_client -connect localhost:31046
openssl s_client -connect localhost:31518
openssl s_client -connect localhost:31691
openssl s_client -connect localhost:31790  # correct port
openssl s_client -connect localhost:31960

# password=kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx
# 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo