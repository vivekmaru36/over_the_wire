#!/bin/bash

# pr statement : The password for the next level is stored in a hidden file in the inhere directory.

# password from level3.sh :
# password="MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx"

set -euo pipefail

host="bandit.labs.overthewire.org"
port=2220
user="bandit3"
password="MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx"

echo "Connecting to $host as $user on port $port ...."

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" "echo 'Password from a file ...Hiding-From-You  : '; cat inhere/...Hiding-From-You"