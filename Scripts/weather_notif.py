#!/usr/bin/env python

from subprocess import call, check_output

w = check_output(["cat", "/home/joe/Scripts/cache/daily_summary"])\
    .decode().split("\n")

call(["dunstify", "-t", "15000", w[1], "\n".join(w[2:])])
