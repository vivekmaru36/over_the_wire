#!/bin/bash

# Pr : The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work. Use mkdir with a hard to guess directory name. Or better, use the command “mktemp -d”. Then copy the datafile using cp, and rename it using mv (read the manpages!)



set -eou pipefail

password=7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4 #from level 12
host="bandit.labs.overthewire.org"
port=2220
user="bandit12"

echo "Connecting to $host as $user on port $port ...."

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host"

# history of commands to achieve the password 

# this thing stores history of level12 to get password through series of xxd -r , file, mv,gunzip,bunzip2,tar -xf

# :wq!

#     1  clear
#     2  ll
#     3  cat data.txt
#     4  clear
#     5  ll
#     6  df -h
#     7  clear
#     8  cd /tmp/
#     9  ll
#    10  man mktemp
#    11  mkdir vivek
#    12  mktemp -d vivek
#    13  mktemp -d
#    14  ll
#    15  cd -
#    16  ll
#    17  cd +
#    18  cd -
#    19  cp data.txt /tmp/tmp.rW7K2rNUhJ
#    20  cd /tmp/tmp.rW7K2rNUhJ
#    21  ll
#    22  cat data.txt
#    23  man hd
#    24  hd data.txt
#    25  hd data.txt | grep password
#    26  pwd
#    27  hd data.txt | grep password
#    28  man xxd
#    29  xxd -r data.txt > hex_og_comp_file
#    30  ll
#    31  cat hex_og_comp_file
#    32  file hex_og_comp_file
#    33  mv hex_og_comp_file hex_og_comp_file.gz
#    34  gunzip hex_og_comp_file.gz
#    35  ll
#    36  cat hex_og_comp_file
#    37  file hex_og_comp_file
#    38  mv hex_og_comp_file hex_og_comp_file.bz2
#    39  bunzip hex_og_comp_file.bz2
#    40  ll
#    41  bunzip2 hex_og_comp_file.bz2
#    42  ll
#    43  cat hex_og_comp_file
#    44  file hex_og_comp_file
#    45  mv hex_og_comp_file hex_og_comp_file.gz
#    46  ll
#    47  gunzip hex_og_comp_file.gz
#    48  ll
#    49  cat hex_og_comp_file
#    50  file hex_og_comp_file
#    51  ll
#    52  which tar
#    53  tar -xf hex_og_comp_file
#    54  ll
#    55  cat data5.bin
#    56  cat hex_og_comp_file
#    57  ll
#    58  file hex_og_comp_file
#    59  file data5.bin
#    60  mv data5.bin data5.tar
#    61  ll
#    62  tar -xf data5.tar
#    63  ll
#    64  cat data6.bin
#    65  file data6.bin
#    66  mv data6.bin data6.bz2
#    67  bzip2 -d data6.bz2
#    68  ll
#    69  cat data6
#    70  file data
#    71  file data6
#    72  mv data6 data6.tar
#    73  tar -xf data6.tar
#    74  ll
#    75  cat data8.bin
#    76  file data8.bin
#    77  mv data8.bin data8.gz
#    78  gunzip data8.gz
#    79  ll
#    80  cat data8
#    81  cat > history_of_commands
#    82  ccat history_of_commands
#    83  cat history_of_commands

# bandit12@bandit:/tmp/tmp.rW7K2rNUhJ$ cat data8
# The password is FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn


# create a script that does all of the following and displays the password

# reference : 
# https://chatgpt.com/share/68931914-8fb0-8006-a9b9-6e31ad45209f
