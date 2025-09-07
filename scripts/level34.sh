#!/bin/bash

# Level Goal
# At this moment, level 34 does not exist yet.


host="bandit.labs.overthewire.org"
port=2220
user="bandit33"
password="tQdtbs5D5i2vJwkO8mEyYEyTL8izoeJ0"

sshpass -p "$password" ssh -p $port $user@$host 

ll
cat README.txt

# bandit33@bandit:~$ cat README.txt 
# Congratulations on solving the last level of this game!

# At this moment, there are no more levels to play in this game. However, we are constantly working
# on new levels and will most likely expand this game with more levels soon.
# Keep an eye out for an announcement on our usual communication channels!
# In the meantime, you could play some of our other wargames.

# If you have an idea for an awesome new level, please let us know!