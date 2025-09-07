#!/bin/bash

# Problem : 
# A daemon is listening on port 30002 and will give you the password for bandit25 if given the password for bandit24 and a secret numeric 4-digit pincode. There is no way to retrieve the pincode except by going through all of the 10000 combinations, called brute-forcing.
# You do not need to create new connections each time

host="bandit.labs.overthewire.org"
port=2220
user="bandit24"
password=gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8


# sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host 


echo "create the vivek directory to store python file ..."
sshpass -p "$password" ssh -p $port $user@$host "mkdir -p /tmp/vivek"

echo "send the python file through scp using sshpass ..."
sshpass -p "$password" scp -P $port L_25_brute.py $user@$host:/tmp/vivek/

sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host << 'EOF'

echo "Run the python file L_25_brute.py"
cd /tmp/vivek/
python3 L_25_brute.py

# clean up
rm -rf /tmp/vivek/

EOF



# if you don't want to scp and want the spython script to get created on the server use the below mehtod

# cat << 'EOL' > script.sh
# #!/bin/bash
# cat /etc/bandit_pass/bandit24 > /tmp/vivek/pass
# EOL