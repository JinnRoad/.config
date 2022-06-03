"""Randomizes lines"""

import pyperclip
import random
import sys

lines = [line for line in pyperclip.paste().split('\n') if line]
random.shuffle(lines)
pyperclip.copy('\n'.join(lines) + '\n')

'''

a
b
d
e
c
f

'''
