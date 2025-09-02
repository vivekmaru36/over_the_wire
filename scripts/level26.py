# #!/bin/bash

# i hate minimizing my screen eveytime  i do ssh and getting that pass so i just copied it now and we use it and again doing that random sets of manual work to exit this shit

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

print("\n inside a real bash shell as bandit26 no way : \n")

child.sendline("c")

child.sendline("echo 'Password for bandit 26 is : \n'")
child.sendline("cat /etc/bandit_pass/bandit26")
child.interact() # this gives me back control    # very crucial line if this don't work nothing works

# child.close(force=True)  can't seem to exit the script when fully have to same steps in reverse order

# steps need to automate for exiting the script

# exit
# enter 6 times
# esc :q!
# yeah i know


# it worked no way !!!!!!!!!

# host="bandit.labs.overthewire.org"
# port=2220
# user="bandit25"
# password=iCi86ttT4KSNe1armKiwbQNmB3YJP3q4

# # Logging in to bandit26 from bandit25 should be fairly easy… The shell for user bandit26 is not /bin/bash, but something else. Find out what it is, how it works and how to break out of it.

# # N0TE: if you’re a Windows user and typically use Powershell to ssh into bandit: Powershell is known to cause issues with the intended solution to this level. You should use command prompt instead.

# sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host 
# sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $user@$host << 'EOF'

# echo "Here is your custom bin for bandit26 : "
# cat /etc/passwd | grep bandit26

# echo "contents inside the custom bin path : "
# cat /usr/bin/showtext

# echo "ssh Key of bandit26 use this to login : "
# cat bandit26.sshkey

# # logging into bandit26 :
# # ssh -o StrictHostKeyChecking=no -i bandit26.sshkey bandit26@localhost -p 2220 | cat /etc/bandit_pass/bandit26
# ssh -o StrictHostKeyChecking=no -i bandit26.sshkey bandit26@localhost -p 2220

# EOF

# # # i found this cause gpt couldn't guide :https://david-varghese.medium.com/overthewire-bandit-level-25-level-26-35d375ef61e

# # use this login but make sure to make you powersheell very small due to more command dependcy
# # once there press v 
# # set shell to bin/bash
# # escape and save the file 
# # just again type shell command you should be able to ssh but still in restriced mode so please don't resize the window and take pass from etc/bandit_pass for next login without this 'more' command issue
# # advice please use escape mode for command execution
# # password for banditpass26 : s0773xxkk0MXfdqOfPRVr9L3jJBUOgCZ

# # How To convert this into script ? now 

# # bandit25@bandit:~$ cat bandit26.sshkey 
# # -----BEGIN RSA PRIVATE KEY-----
# # MIIEpQIBAAKCAQEApis2AuoooEqeYWamtwX2k5z9uU1Afl2F8VyXQqbv/LTrIwdW
# # pTfaeRHXzr0Y0a5Oe3GB/+W2+PReif+bPZlzTY1XFwpk+DiHk1kmL0moEW8HJuT9
# # /5XbnpjSzn0eEAfFax2OcopjrzVqdBJQerkj0puv3UXY07AskgkyD5XepwGAlJOG
# # xZsMq1oZqQ0W29aBtfykuGie2bxroRjuAPrYM4o3MMmtlNE5fC4G9Ihq0eq73MDi
# # 1ze6d2jIGce873qxn308BA2qhRPJNEbnPev5gI+5tU+UxebW8KLbk0EhoXB953Ix
# # 3lgOIrT9Y6skRjsMSFmC6WN/O7ovu8QzGqxdywIDAQABAoIBAAaXoETtVT9GtpHW
# # qLaKHgYtLEO1tOFOhInWyolyZgL4inuRRva3CIvVEWK6TcnDyIlNL4MfcerehwGi
# # il4fQFvLR7E6UFcopvhJiSJHIcvPQ9FfNFR3dYcNOQ/IFvE73bEqMwSISPwiel6w
# # e1DjF3C7jHaS1s9PJfWFN982aublL/yLbJP+ou3ifdljS7QzjWZA8NRiMwmBGPIh
# # Yq8weR3jIVQl3ndEYxO7Cr/wXXebZwlP6CPZb67rBy0jg+366mxQbDZIwZYEaUME
# # zY5izFclr/kKj4s7NTRkC76Yx+rTNP5+BX+JT+rgz5aoQq8ghMw43NYwxjXym/MX
# # c8X8g0ECgYEA1crBUAR1gSkM+5mGjjoFLJKrFP+IhUHFh25qGI4Dcxxh1f3M53le
# # wF1rkp5SJnHRFm9IW3gM1JoF0PQxI5aXHRGHphwPeKnsQ/xQBRWCeYpqTme9amJV
# # tD3aDHkpIhYxkNxqol5gDCAt6tdFSxqPaNfdfsfaAOXiKGrQESUjIBcCgYEAxvmI
# # 2ROJsBXaiM4Iyg9hUpjZIn8TW2UlH76pojFG6/KBd1NcnW3fu0ZUU790wAu7QbbU
# # i7pieeqCqSYcZsmkhnOvbdx54A6NNCR2btc+si6pDOe1jdsGdXISDRHFb9QxjZCj
# # 6xzWMNvb5n1yUb9w9nfN1PZzATfUsOV+Fy8CbG0CgYEAifkTLwfhqZyLk2huTSWm
# # pzB0ltWfDpj22MNqVzR3h3d+sHLeJVjPzIe9396rF8KGdNsWsGlWpnJMZKDjgZsz
# # JQBmMc6UMYRARVP1dIKANN4eY0FSHfEebHcqXLho0mXOUTXe37DWfZza5V9Oify3
# # JquBd8uUptW1Ue41H4t/ErsCgYEArc5FYtF1QXIlfcDz3oUGz16itUZpgzlb71nd
# # 1cbTm8EupCwWR5I1j+IEQU+JTUQyI1nwWcnKwZI+5kBbKNJUu/mLsRyY/UXYxEZh
# # ibrNklm94373kV1US/0DlZUDcQba7jz9Yp/C3dT/RlwoIw5mP3UxQCizFspNKOSe
# # euPeaxUCgYEAntklXwBbokgdDup/u/3ms5Lb/bm22zDOCg2HrlWQCqKEkWkAO6R5
# # /Wwyqhp/wTl8VXjxWo+W+DmewGdPHGQQ5fFdqgpuQpGUq24YZS8m66v5ANBwd76t
# # IZdtF5HXs2S5CADTwniUS5mX1HO9l5gUkk+h0cH5JnPtsMCnAUM+BRY=
# # -----END RSA PRIVATE KEY-----