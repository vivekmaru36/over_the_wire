import base64

b1 = base64.b64decode("HmYkBwozJw4WNyAAFyB1VUcqOE1JZjUIBis7ABdmbU1GIjEJAyIxTRg=")
b2 = base64.b64decode("eyJzaG93cGFzc3dvcmQiOiJubyIsImJnLWNvbG9yIjoiI2ZmZmZmZiJ9")

# XOR byte by byte
result = bytes([x ^ y for x, y in zip(b1, b2)])   # now i understand this
# print(x)
print(result)  # eDWo eDWo eDWo



b3=base64.b64decode("eDWo")
# b4=base64.b64decode('{"showpassword":"yes","bgcolor":"#ffffff"}')   # but this gives no error why ?
# b4=base64.b64decode('{"showpassword":"no","bgcolor":"#ffffff"}')       # why this gives error god i can't understand
b4 = b'{"showpassword":"yes","bgcolor":"#ffffff"}'  # directly as bytes

# XOR byte by byte
result = bytes([x ^ y for x, y in zip(b3, b4)]) 
print(result)