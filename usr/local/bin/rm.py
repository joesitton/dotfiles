#!/usr/bin/env python3

from sh import rm
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument("files", nargs="+")
parser.add_argument("-r", action="store_const", const=1)
args = parser.parse_args()

keep = []

for f in args.files:
    if "@" in f:
        keep += [x for x in args.files if f[1:] in x]

files = [f for f in args.files if not f in keep]

try:
    rm("-r", files) if args.r else rm(files)
except:
    print("rm: cannot remove '{}'".format(", ".join(files)))
