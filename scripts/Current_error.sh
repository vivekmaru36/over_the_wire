# level 13 script can't understand how to make script 


#!/bin/bash

# Bandit level 12 to 13
# Prerequisite: sshpass must be installed.

set -euo pipefail

password="7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4"  # Bandit level 12 password
host="bandit.labs.overthewire.org"
port=2220
user="bandit12"

echo "[+] Connecting to $host as $user..."

sshpass -p "$password" ssh -o StrictHostKeyChecking=no -p "$port" "$user@$host" bash << 'EOF'
set -euo pipefail

# Create a temp working directory
temp_dir=$(mktemp -d)
cd "$temp_dir"

# Copy and reverse the hexdump to binary
cp ~/data.txt .
xxd -r data.txt > stage0

# Function to determine file type
function get_file_type {
    file "$1" | awk -F: '{print $2}' | xargs
}

filename="stage0"
stage=0

# Decompression loop
while true; do
    filetype=$(get_file_type "$filename")

    case "$filetype" in
        *"gzip compressed data"*)
            mv "$filename" "stage$stage.gz"
            gunzip "stage$stage.gz"
            filename="stage$stage"
            ;;
        *"bzip2 compressed data"*)
            mv "$filename" "stage$stage.bz2"
            bunzip2 "stage$stage.bz2"
            filename="stage$stage"
            ;;
        *"POSIX tar archive"*)
            mkdir "untar_stage$stage"
            tar -xf "$filename" -C "untar_stage$stage"
            cd "untar_stage$stage"
            filename=$(ls)
            stage=$((stage + 1))
            continue
            ;;
        *"ASCII text"*)
            echo "[+] Final file contents:"
            cat "$filename"
            break
            ;;
        *)
            echo "[!] Unknown format: $filetype"
            break
            ;;
    esac

    stage=$((stage + 1))
done

# Cleanup
cd /tmp
rm -rf "$temp_dir"
EOF
