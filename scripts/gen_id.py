"""
ID generator for files prefix or suffix based on date time.
"""

from datetime import datetime
from pyperclip import copy
from time import sleep

while True:
    dt_obj = datetime.now()
    t = dt_obj.strftime("%Y%m%d%H%M%S")
    print(t)
    copy(f"[{t}]")
    sleep(1)
