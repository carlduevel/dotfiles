#!/usr/bin/env python3

# This hooks script syncs task warrior to the configured task server.
# The on-exit event is triggered once, after all processing is complete.

# Make sure hooks are enabled and this hook script is executable. 
# Run `task diag` for diagnostics on the hook.

import sys
import json
import subprocess
import socket

"""
This functions checks connection to Google DNS server
If DNS server is reachable on port 53, then it means that
the internet is up and running
"""


def internet_connected(host="8.8.8.8", port=53):
    """
    Host: 8.8.8.8 (google-public-dns-a.google.com)
    OpenPort: 53/tcp
    Service: domain (DNS/TCP)
    """
    try:
        socket.setdefaulttimeout(1)
        socket.socket(socket.AF_INET, socket.SOCK_STREAM).connect((host, port))
        return True
    except:
        return False

if internet_connected():
    try:
        tasks = json.loads(sys.stdin.readline())
    except:
        # No input
        pass

    # Call the `sync` command
    # hooks=0 ensures that the sync command doesn't call the on-exit hook
    # verbose=nothing sets the verbosity to print nothing at all
    try:
        subprocess.call(["task", "rc.hooks=0", "rc.verbose=nothing", "sync"], timeout=2)
    except:
        pass
