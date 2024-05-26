"""
Random file name generator. This isn't ordered and very long to use for whole
file.
"""

from uuid import uuid4
from pyperclip import copy
from time import sleep

while True:
    name = str(uuid4())
    print(name)
    copy(name)
    sleep(0.5)
