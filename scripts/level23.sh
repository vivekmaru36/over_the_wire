#!/bin/bash

# A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

# NOTE: Looking at shell scripts written by other people is a very useful skill. The script for this level is intentionally made easy to read. If you are having problems understanding what it does, try executing it to see the debug information it prints.


host="bandit.labs.overthewire.org"
port=2220
user="bandit22"
password=tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q

# sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host 
sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host << 'EOF'

value=$(echo I am user bandit23 | md5sum | cut -d ' ' -f 1)
echo Password for bandit23 is :  
cat /tmp/$value

EOF

# bandit22@bandit:/etc/cron.d$ cat  /usr/bin/cronjob_bandit23.sh
# #!/bin/bash

# myname=$(whoami) # its bandit22 
# mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

# echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

# cat /etc/bandit_pass/$myname > /tmp/$mytarget


# decryption is here
# bandit22@bandit:/etc/cron.d$ echo I am user bandit22 | md5sum | cut -d ' ' -f 1
# 8169b67bd894ddbb4412f91573b38db3 # this is md5 signature echo I am user bandit22 | md5sum | cut -d ' ' -f 1

# decryption from md5 using
# echo I am user bandit23 | md5sum | cut -d ' ' -f 
# 8ca319486bfbbc3663ea0fbe81326349

# password should be 
# cat /tmp/8ca319486bfbbc3663ea0fbe81326349
