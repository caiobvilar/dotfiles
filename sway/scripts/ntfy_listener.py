#!/usr/bin/env python3

import sys
import requests
import json
import subprocess

if len(sys.argv) < 2:
    print("Usage: ntfy-listener.py <topic>")
    sys.exit(1)

topic = sys.argv[1]
resp = requests.get(f"https://ntfy.caioguimaraes.com.br/{topic}/json", stream=True)
for line in resp.iter_lines():
    if line:
        data = json.loads(line)
        if data.get("event") == "message":
            title = data.get("title", "ntfy")
            message = data.get("message", "")
            subprocess.run(["notify-send", "-u", "normal", title, message])

