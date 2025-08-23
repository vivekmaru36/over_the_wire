#!/bin/bash

host="bandit.labs.overthewire.org"
port=2220
# user="bandit17"
user="bandit18"
password=x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO

sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host