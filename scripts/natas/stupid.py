# dump_natas7.py
from playwright.sync_api import sync_playwright
import re

with sync_playwright() as p:
    browser = p.chromium.launch()
    page = browser.new_page()
    page.set_extra_http_headers({})
    # set basic auth
    page.context.set_default_navigation_timeout(30000)
    page.context.set_http_credentials({"username": "natas7", "password": "bmg8SvU1LizuWjx3y7xkNERkHxGre0GS"})
    page.goto("http://natas7.natas.labs.overthewire.org/", wait_until="networkidle")
    content = page.content()   # rendered HTML
    # search for token like xco... or any long alnum token
    m = re.search(r'(xco[A-Za-z0-9]{10,}|[A-Za-z0-9]{20,})', content)
    if m:
        print(m.group(1))
    else:
        print("Token not found.")
    browser.close()
