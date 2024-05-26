import datetime
import pyperclip
import time
import random

while True:
    dt_obj = datetime.datetime.now()
    t = dt_obj.strftime("%Y%m%d%H%M%S")
    print(t)
    pyperclip.copy(f"[{t}]")
