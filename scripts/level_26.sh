#!/bin/bash

host="bandit.labs.overthewire.org"
port=2220
user="bandit25"
password=iCi86ttT4KSNe1armKiwbQNmB3YJP3q4

sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host 
