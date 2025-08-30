#!/bin/bash

host="bandit.labs.overthewire.org"
port=2220
user="bandit24"
password=gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8

sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host 