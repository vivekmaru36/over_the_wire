# Natas Level 7 → Level 8
# Username: natas8
# URL:      http://natas8.natas.labs.overthewire.org


# no way :
# source Code :

# <html>
# <head>
# <!-- This stuff in the header has nothing to do with the level -->
# <link rel="stylesheet" type="text/css" href="http://natas.labs.overthewire.org/css/level.css">
# <link rel="stylesheet" href="http://natas.labs.overthewire.org/css/jquery-ui.css" />
# <link rel="stylesheet" href="http://natas.labs.overthewire.org/css/wechall.css" />
# <script src="http://natas.labs.overthewire.org/js/jquery-1.9.1.js"></script>
# <script src="http://natas.labs.overthewire.org/js/jquery-ui.js"></script>
# <script src=http://natas.labs.overthewire.org/js/wechall-data.js></script><script src="http://natas.labs.overthewire.org/js/wechall.js"></script>
# <script>var wechallinfo = { "level": "natas8", "pass": "<censored>" };</script></head>
# <body>
# <h1>natas8</h1>
# <div id="content">

# <?

# $encodedSecret = "3d3d516343746d4d6d6c315669563362";

# function encodeSecret($secret) {
#     return bin2hex(strrev(base64_encode($secret)));
# }

# if(array_key_exists("submit", $_POST)) {
#     if(encodeSecret($_POST['secret']) == $encodedSecret) {
#     print "Access granted. The password for natas9 is <censored>";
#     } else {
#     print "Wrong secret";
#     }
# }
# ?>

# <form method=post>
# Input secret: <input name=secret><br>
# <input type=submit name=submit>
# </form>

# <div id="viewsource"><a href="index-source.html">View sourcecode</a></div>
# </div>
# </body>
# </html>


# first learn how to convert a binary to hexa decimal number here : https://www.youtube.com/watch?v=tSLKOKGQq0Y

# Refrence table for hexadecimal
# ----------------------------------------------------------
# Binary to hexadecimal conversion table
# Decimal 	Binary	Hexadecimal
# 0	0000	0
# 1	0001	1
# 2	0010	2
# 3	0011	3
# 4	0100	4
# 5	0101	5
# 6	0110	6
# 7	0111	7
# 8	1000	8
# 9	1001	9
# 10	1010	A
# 11	1011	B
# 12	1100	C
# 13	1101	D
# 14	1110	E
# 15	1111	F
# ---------------------------------------------------------------


# can't seem to understand this don't know why
# $encodedSecret = "3d3d516343746d4d6d6c315669563362";

# function encodeSecret($secret) {
#     return bin2hex(strrev(base64_encode($secret)));
# }



# i am not sure but this is what i got from sitting with it for a day
# <?php
# $encodedSecret = "3d3d516343746d4d6d6c315669563362";

# function encodeSecret($secret) {
#     return bin2hex(strrev(base64_encode($secret)));
# }
# function getpass($encodedSecret){
#     return base64_decode(strrev(hex2bin($encodedSecret)));
# }

# echo "\n";

# echo getpass($encodedSecret)

# Is this the pass ? yes it was
# output : oubWYf2kBq
# Access granted. The password for natas9 is ZE1ck82lmdGIoErlhQgWND6j2Wzz6b6t

# ?>


import requests ,re

auth_user="natas8"

auth_pass="xcoXLmzMkoIP9D7hlgPlh9XD7OgLAe5Q"

url="http://natas8.natas.labs.overthewire.org/"
url_source_code="http://natas8.natas.labs.overthewire.org/index-source.html"

# params not neded here
# params={
#     "page":
# }

# sumbit the form using POST

data={
    "secret":"oubWYf2kBq",
    "submit":"submit"
}

resp=requests.post(url,auth=(auth_user,auth_pass),data=data)

text=resp.text

# print(text)

m=re.findall(r'(password for natas9 is [A-za-z0-9]{5,40})',text)
print(m)