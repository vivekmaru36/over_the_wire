import base64

b1 = base64.b64decode("HmYkBwozJw4WNyAAFyB1VUcqOE1JZjUIBis7ABdmbU1GIjEJAyIxTRg=")
b2 = base64.b64decode("eyJzaG93cGFzc3dvcmQiOiJubyIsImJnLWNvbG9yIjoiI2ZmZmZmZiJ9")

# XOR byte by byte
result = bytes([x ^ y for x, y in zip(b1, b2)])   # i still need to understand this properly

print(result)

# new cookie proccess   
b3=result
b4={"showpassword":"no","bg-color":"#ffffff"}


result2 = bytes([x ^ y for x, y in zip(b3, b4)])   

print(result2)

