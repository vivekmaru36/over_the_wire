#!/bin/bash

host="bandit.labs.overthewire.org"
port=2220
user="bandit23"
password=0Zf11ioIjMVN551jX3CmStKLYqjk54Ga

sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host