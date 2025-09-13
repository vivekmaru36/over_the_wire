# Natas Level 0 → Level 1
# Username: natas1
# URL:      http://natas1.natas.labs.overthewire.org

# You can find the password for the next level on this page, but rightclicking has been blocked!


# password from nlevel0.py = 0nzCigAq7t2iALyvU9xcHlYN4MlkIwlq

import requests # pyright: ignore[reportMissingModuleSource]

username="natas1"
password="0nzCigAq7t2iALyvU9xcHlYN4MlkIwlq"

url="http://natas1.natas.labs.overthewire.org"

# start the seesion 
session=requests.Session()
# don't forget to authenticate please
session.auth=(username,password)

# initiate the request to read res body
response=session.get(url)

# search the pass for natas 2 in body

print(response.text)

import re

password_match=re.search(r'The password for natas2 is ([A-Za-z0-98]+)',response.text)

if password_match:
    print("Password for natas2 level is : ",password_match.group(0))
else :
    print("Could not find password for natas2")


# password for natas2
# password=TguMNxKo1DSa1tujBLuZJnDUlCcUAPlI