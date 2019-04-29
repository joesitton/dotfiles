#!/usr/bin/env python

from subprocess import check_output, call

updates = check_output(["checkupdates"]).decode().split("\n")[:-1]
updates = [u.split(" ")[0] + "\n" for u in updates][:10]

call(["dunstify", "Available updates:", "".join(updates)])
