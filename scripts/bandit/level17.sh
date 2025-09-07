#!/bin/bash


# The credentials for the next level can be retrieved by submitting the password of the current level to a port on localhost in the range 31000 to 32000. First find out which of these ports have a server listening on them. Then find out which of those speak SSL/TLS and which don’t. There is only 1 server that will give the next credentials, the others will simply send back to you whatever you send to it.

# Helpful note: Getting “DONE”, “RENEGOTIATING” or “KEYUPDATE”? Read the “CONNECTED COMMANDS” section in the manpage


host="bandit.labs.overthewire.org"
# port=30000
port=2220
# user="bandit14"
# user="bandit17"
user="bandit16"
password=kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" << 'EOF'

passtosend="kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx"  

# Scan ports quickly
ports=$(nmap -p31000-32000 localhost | grep open | awk '{print $1}' | cut -d/ -f1)

# Loop through open ports and test with openssl
for n in $ports; do
  echo "=== Checking port $n ==="
  echo $passtosend | openssl s_client -connect localhost:$n -quiet 
  echo
done

EOF
# # sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" << 'EOF'

# passtosend=$(cat .bandit15.password)
# echo $passtosend

# ports=$(nmap -p31000-32000 localhost | grep open | awk '{print $1}' | cut -d/ -f1)
# echo $ports

# for n in $ports ;

# do 
# echo "The following port is being checked : "$n
# echo "$passtosend"  openssl s_client -connect localhost:$n -quiet

# done

# logout

# EOF

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



# openssl s_client -connect localhost:31046
# openssl s_client -connect localhost:31518
# openssl s_client -connect localhost:31691
# openssl s_client -connect localhost:31790  # correct port
# openssl s_client -connect localhost:31960

# password=kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx
# 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo --> this pass is there to confuse me and i got confused to understand the whole mess read below points explained by gpt

# ---------------------------------------------------------------------------- MESS ------------------------------
# That means the service is expecting the password for bandit16, not bandit15.

# Here’s why:

# You are currently logged in as bandit16.

# The .bandit15.password file you looked at is the old password you used to get into bandit16.

# To continue, you need to send the current level’s password (bandit16’s) to the SSL service on port 31790, not the bandit15 one.

# But notice: you don’t know bandit16’s password yet — that’s exactly what you’re supposed to get back from this SSL service.

# The catch is: this service expects you to provide the current (bandit16) password to authenticate first. But you don’t have that yet — so the trick is actually:

# 👉 You must pass the bandit16 password stored in /etc/bandit_pass/bandit16 (accessible only if you’re root) OR get it through the designed pipeline using bandit15 → bandit16 → 31790.

# The reason you see the error is that you sent the wrong password (bandit15’s).

# 🔑 Hint to solve properly:

# The service on port 31790 is the "SSL shell" that gives you the next password (for bandit17).

# To access it, you need to send bandit16’s password (not bandit15’s).

# But bandit16’s password is actually in /etc/bandit_pass/bandit16, which you cannot read directly unless you use the right method (the trick is to use the password from .bandit15.password to ssh into bandit16 in the first place).



# password is here for level 18.sh i know its an rsa key we can't do anything

# verify return:1

# Correct!
# -----BEGIN RSA PRIVATE KEY-----
# MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJ
# imZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQ
# Ja6Lzb558YW3FZl87ORiO+rW4LCDCNd2lUvLE/GL2GWyuKN0K5iCd5TbtJzEkQTu
# DSt2mcNn4rhAL+JFr56o4T6z8WWAW18BR6yGrMq7Q/kALHYW3OekePQAzL0VUYbW
# JGTi65CxbCnzc/w4+mqQyvmzpWtMAzJTzAzQxNbkR2MBGySxDLrjg0LWN6sK7wNX
# x0YVztz/zbIkPjfkU1jHS+9EbVNj+D1XFOJuaQIDAQABAoIBABagpxpM1aoLWfvD
# KHcj10nqcoBc4oE11aFYQwik7xfW+24pRNuDE6SFthOar69jp5RlLwD1NhPx3iBl
# J9nOM8OJ0VToum43UOS8YxF8WwhXriYGnc1sskbwpXOUDc9uX4+UESzH22P29ovd
# d8WErY0gPxun8pbJLmxkAtWNhpMvfe0050vk9TL5wqbu9AlbssgTcCXkMQnPw9nC
# YNN6DDP2lbcBrvgT9YCNL6C+ZKufD52yOQ9qOkwFTEQpjtF4uNtJom+asvlpmS8A
# vLY9r60wYSvmZhNqBUrj7lyCtXMIu1kkd4w7F77k+DjHoAXyxcUp1DGL51sOmama
# +TOWWgECgYEA8JtPxP0GRJ+IQkX262jM3dEIkza8ky5moIwUqYdsx0NxHgRRhORT
# 8c8hAuRBb2G82so8vUHk/fur85OEfc9TncnCY2crpoqsghifKLxrLgtT+qDpfZnx
# SatLdt8GfQ85yA7hnWWJ2MxF3NaeSDm75Lsm+tBbAiyc9P2jGRNtMSkCgYEAypHd
# HCctNi/FwjulhttFx/rHYKhLidZDFYeiE/v45bN4yFm8x7R/b0iE7KaszX+Exdvt
# SghaTdcG0Knyw1bpJVyusavPzpaJMjdJ6tcFhVAbAjm7enCIvGCSx+X3l5SiWg0A
# R57hJglezIiVjv3aGwHwvlZvtszK6zV6oXFAu0ECgYAbjo46T4hyP5tJi93V5HDi
# Ttiek7xRVxUl+iU7rWkGAXFpMLFteQEsRr7PJ/lemmEY5eTDAFMLy9FL2m9oQWCg
# R8VdwSk8r9FGLS+9aKcV5PI/WEKlwgXinB3OhYimtiG2Cg5JCqIZFHxD6MjEGOiu
# L8ktHMPvodBwNsSBULpG0QKBgBAplTfC1HOnWiMGOU3KPwYWt0O6CdTkmJOmL8Ni
# blh9elyZ9FsGxsgtRBXRsqXuz7wtsQAgLHxbdLq/ZJQ7YfzOKU4ZxEnabvXnvWkU
# YOdjHdSOoKvDQNWu6ucyLRAWFuISeXw9a/9p7ftpxm0TSgyvmfLF2MIAEwyzRqaM
# 77pBAoGAMmjmIJdjp+Ez8duyn3ieo36yrttF5NSsJLAbxFpdlc1gvtGCWW+9Cq0b
# dxviW8+TFVEBl1O4f7HVm6EpTscdDxU+bCXWkfjuRb7Dy9GOtt9JPsX8MBTakzh3
# vBgsyi/sN3RqRBcGU40fOoZyfAMT8s1m/uYv52O6IgeuZ/ujbjY=
# -----END RSA PRIVATE KEY-----