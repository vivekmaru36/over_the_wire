#!/bin/bash

# pr statement : The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions


set -eou pipefail

password="dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr"
host="bandit.labs.overthewire.org"
port=2220
user="bandit11"


echo "Connecting to $host as $user on port $port ...."

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" "echo 'The password for bandit12 is : '; cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'"


# learn rot13 cipher

# since the rot3 cipbher is based on the subustion of 13 letter of each alphabet series 

# letter n is 13th
# ABCDEFGHIJKLM N OPQRSTUVWXYZ
# A ↔ N
# B ↔ O
# C ↔ P
# ...
# M ↔ Z
# N ↔ A
# O ↔ B
# ...
# Z ↔ M


# therefore the below 2 commands are wrong even if it looks right
# tr needs no spacing or else it will treat it as space charachter
# cat data.txt | tr 'A-Z a-z' 'A-M N-Z a-m n-z'
# cat data.txt | tr 'A-Za-z' 'A-MN-Za-mn-z'
# correct command 
# cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'




# cat data.txt | tr 'A-Za-z' 'A-MN-Za-mn-z'
#  This above command is still incorrect for ROT13:
# bash
# Copy
# Edit
# cat data.txt | tr 'A-Za-z' 'A-MN-Za-mn-z'
# It will not work as expected. Here's exactly why:

#  How tr works:
# tr maps character-by-character from the first set to the second set, in order.

# So:

# First char in set1 maps to first char in set2,

# Second to second, ...

# Up to the length of the shorter of the two sets.

# Let's analyze:
# Input set: 'A-Za-z'
# This expands to:

# nginx
# Copy
# Edit
# ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
# → 52 characters

# Your output set: 'A-MN-Za-mn-z'
# Expands to:

# nginx
# Copy
# Edit
# ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
# Wait — looks similar? Let’s count:

# 'A-M' = 13 characters

# 'N-Z' = 13 characters

# 'a-m' = 13 characters

# 'n-z' = 13 characters
# → Total =  52 characters

# But the order matters!

# ROT13 requires:
# bash
# Copy
# Edit
# 'A-Za-z' → 'N-ZA-Mn-za-m'
# Which maps:

# A → N

# B → O

# C → P

# ...

# N → A

# O → B

# ...

# But your set 'A-MN-Za-mn-z' maps:

# A → A

# B → B

# ...

# M → M

# N → N

# O → O

# ...

# Z → Z

# → This just maps A-Z to A-Z again (no rotation), so it does nothing!