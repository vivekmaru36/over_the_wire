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