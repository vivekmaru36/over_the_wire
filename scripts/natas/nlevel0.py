# Natas teaches the basics of serverside web-security.

# Each level of natas consists of its own website located at http://natasX.natas.labs.overthewire.org, where X is the level number. There is no SSH login. To access a level, enter the username for that level (e.g. natas0 for level 0) and its password.

# Each level has access to the password of the next level. Your job is to somehow obtain that next password and level up. All passwords are also stored in /etc/natas_webpass/. E.g. the password for natas5 is stored in the file /etc/natas_webpass/natas5 and only readable by natas4 and natas5.

# Start here:

# Username: natas0
# Password: natas0
# URL:      http://natas0.natas.labs.overthewire.org


# the password for netstat 1 is in index file by clikcking view source you should be able to see it 
# <!--The password for natas1 is 0nzCigAq7t2iALyvU9xcHlYN4MlkIwlq -->

# now ? how to make it work so i don't have to click and find view source an print the password here in terminal

# top->natas0.natas.labs.overthewire.org->(index)
# <html>
# <head>
# <!-- This stuff in the header has nothing to do with the level -->
# <link rel="stylesheet" type="text/css" href="http://natas.labs.overthewire.org/css/level.css">
# <link rel="stylesheet" href="http://natas.labs.overthewire.org/css/jquery-ui.css" />
# <link rel="stylesheet" href="http://natas.labs.overthewire.org/css/wechall.css" />
# <script src="http://natas.labs.overthewire.org/js/jquery-1.9.1.js"></script>
# <script src="http://natas.labs.overthewire.org/js/jquery-ui.js"></script>
# <script src=http://natas.labs.overthewire.org/js/wechall-data.js></script><script src="http://natas.labs.overthewire.org/js/wechall.js"></script>
# <script>var wechallinfo = { "level": "natas0", "pass": "natas0" };</script></head>
# <body>
# <h1>natas0</h1>
# <div id="content">
# You can find the password for the next level on this page.

# <!--The password for natas1 is 0nzCigAq7t2iALyvU9xcHlYN4MlkIwlq -->
# </div>
# </body>
# </html>


import requests
from getpass import getpass
 
# Natas 0 credentials
username = "natas0"
password = "natas0"

# URL of the level
url = "http://natas0.natas.labs.overthewire.org"

# Start a session
session = requests.Session()
session.auth = (username, password)

# Make a request
response = session.get(url)

# Look for the password in the response
# For Natas0, it's usually in an HTML comment
import re

password_match = re.search(r'<!--\s*(\w+)\s*-->', response.text)
print(response.text)
if password_match:
    print("Password for next level:", password_match.group(1))
else:
    print("Could not find the password.")
