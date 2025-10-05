# Natas Level 10 → Level 11
# Username: natas11
# URL:      http://natas11.natas.labs.overthewire.org

# -------- Response header for #ffffff submit
# <body style="background: #ffffff;">
# Cookies are protected with XOR encryption<br/><br/>


# --------------------------------
# Need to understand this | i can't understand this xor function and its key placements

# ----------------------
# <?

# $defaultdata = array( "showpassword"=>"no", "bgcolor"=>"#ffffff");

# function xor_encrypt($in) {
#     $key = '<censored>';
#     $text = $in;
#     $outText = '';

#     // Iterate through each character
#     for($i=0;$i<strlen($text);$i++) {
#     $outText .= $text[$i] ^ $key[$i % strlen($key)];
#     }

#     return $outText;
# }

# function loadData($def) {
#     global $_COOKIE;
#     $mydata = $def;
#     if(array_key_exists("data", $_COOKIE)) {
#     $tempdata = json_decode(xor_encrypt(base64_decode($_COOKIE["data"])), true);
#     if(is_array($tempdata) && array_key_exists("showpassword", $tempdata) && array_key_exists("bgcolor", $tempdata)) {
#         if (preg_match('/^#(?:[a-f\d]{6})$/i', $tempdata['bgcolor'])) {
#         $mydata['showpassword'] = $tempdata['showpassword'];
#         $mydata['bgcolor'] = $tempdata['bgcolor'];
#         }
#     }
#     }
#     return $mydata;
# }

# function saveData($d) {
#     setcookie("data", base64_encode(xor_encrypt(json_encode($d))));
# }

# $data = loadData($defaultdata);

# if(array_key_exists("bgcolor",$_REQUEST)) {
#     if (preg_match('/^#(?:[a-f\d]{6})$/i', $_REQUEST['bgcolor'])) {
#         $data['bgcolor'] = $_REQUEST['bgcolor'];
#     }
# }

# saveData($data);

# ?>


# ------------------- walk through

# 1) first learn how to convert ascii to binary
# https://www.youtube.com/watch?v=H4l42nbYmrU 


# 2) How to xor binary characters ?
# https://www.youtube.com/watch?v=GaVcqsOhDw0

# 3) Below is the represtantion of the working of the funciton with 'hello' as input and key as 'Key'


# ### Example

# **Input:** `"HELLO"`
# **Key:** `"KEY"`

# ---

# #### Step 1: Prepare characters

# | Input char | ASCII (binary) | Key char | ASCII (binary) |
# | ---------- | -------------- | -------- | -------------- |
# | H          | 01001000       | K        | 01001011       |
# | E          | 01000101       | E        | 01000101       |
# | L          | 01001100       | Y        | 01011001       |
# | L          | 01001100       | K        | 01001011       |
# | O          | 01001111       | E        | 01000101       |

# > Notice the **key repeats** because input is longer than key.

# ---

# #### Step 2: XOR each character

# Binary XOR rules:

# * 0 ^ 0 = 0
# * 0 ^ 1 = 1
# * 1 ^ 0 = 1
# * 1 ^ 1 = 0

# | Input char | Key char | XOR result (binary) | XOR result (char)      |
# | ---------- | -------- | ------------------- | ---------------------- |
# | H          | K        | 00000011            | `\x03` (non-printable) |
# | E          | E        | 00000000            | `\x00` (non-printable) |
# | L          | Y        | 00010101            | `\x15`                 |
# | L          | K        | 00000111            | `\x07`                 |
# | O          | E        | 00001010            | `\x0A`                 |

# So the **encrypted string** is a series of bytes like `\x03\x00\x15\x07\x0A`.

# ---

# #### Step 3: Decrypt by XORing again

# If you take that encrypted string and run `xor_encrypt(encrypted)`, it XORs each byte **with the same key**:

# * `\x03 ^ K = H`
# * `\x00 ^ E = E`
# * `\x15 ^ Y = L`
# * `\x07 ^ K = L`
# * `\x0A ^ E = O`

#  Original text `"HELLO"` is restored.

# ---

# #### Step 4: Diagram (visual)

# ```
# Input:  H   E   L   L   O
# Key:    K   E   Y   K   E   (repeats as needed)
# XOR →   \x03 \x00 \x15 \x07 \x0A  (encrypted bytes)
# XOR again with same key → H E L L O (decrypted)
# ```

# * Each character of the input is **XORed** with the corresponding key character (looping if needed).
# * This is why XOR encryption is called **symmetric**.
# -------------------------------------------------------------------------------



# ---------------------------------- Second data function with bg color ?  | this one is more complex
#  after checking cookies this is the data variable value : HmYkBwozJw4WNyAAFyB1VUcqOE1JZjUIBis7ABdmbU1GIjEJAyIxTRg%3D
# the %3d in the variable is ascii for '=' 
# cokkie : HmYkBwozJw4WNyAAFyB1VUcqOE1JZjUIBis7ABdmbU1GIjEJAyIxTRg=

# function loadData($def) {
#     global $_COOKIE;
#     $mydata = $def;
#     if(array_key_exists("data", $_COOKIE)) {
#     $tempdata = json_decode(xor_encrypt(base64_decode($_COOKIE["data"])), true);
#     if(is_array($tempdata) && array_key_exists("showpassword", $tempdata) && array_key_exists("bgcolor", $tempdata)) {
#         if (preg_match('/^#(?:[a-f\d]{6})$/i', $tempdata['bgcolor'])) {
#         $mydata['showpassword'] = $tempdata['showpassword'];
#         $mydata['bgcolor'] = $tempdata['bgcolor'];
#         }
#     }
#     }
#     return $mydata;
# }

# function saveData($d) {
#     setcookie("data", base64_encode(xor_encrypt(json_encode($d))));
# }

# $data = loadData($defaultdata);

# if(array_key_exists("bgcolor",$_REQUEST)) {
#     if (preg_match('/^#(?:[a-f\d]{6})$/i', $_REQUEST['bgcolor'])) {
#         $data['bgcolor'] = $_REQUEST['bgcolor'];
#     }
# }

# saveData($data);

# ------------------------
