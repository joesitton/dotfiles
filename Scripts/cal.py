#!/usr/bin/env python

from subprocess import check_output, call
from datetime import datetime
import re

today = datetime.now().day
cal = check_output("cal").decode()
cal = re.sub(str(today), "**", cal)

call(["dunstify",\
        "-u", "low",\
        "-i", "/home/joe/Desktop/notif_blank.png",\
        "".join(cal)])
