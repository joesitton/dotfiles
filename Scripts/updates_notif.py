#!/usr/bin/env python

from subprocess import call

updates = open("/home/joe/Scripts/cache/updates_available", "r").read().split("\n")[:15]

if updates:
    call(["dunstify", "Available updates:", "".join(u + "\n" for u in updates)])
