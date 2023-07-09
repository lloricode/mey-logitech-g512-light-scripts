#!/usr/bin/env python3

import time
import random
import subprocess

# ------------------------------------------------------------
# Generate random hex RGB value.
# Retry if less than #111111
# ------------------------------------------------------------
def getColor():
    color = '{:06x}'.format(random.randint(0, 0xffffff))
    if color < '222222':
        color = 'ffffff'

    return color


# ------------------------------------------------------------
# List of keys to affect
# ------------------------------------------------------------
keys = [
    'esc',

    # Function F1-F12
    'f1', 'f2', 'f3', 'f4', 'f5', 'f6', 'f7', 'f8', 'f9', 'f10', 'f11', 'f12',

    # Print Screen, Scroll Lock, Pause
    'printscr', 'scrolllock', 'pause',

    'ins', 'del', 'home', 'end', 'pageup', 'pagedown',

    # Arrow keys
    'top', 'right', 'bottom', 'left',

    # Numpad
    'numlock', 'numslash', 'numasterisk', 'numminus', 'numplus', 'numenter',
    'num0', 'num1', 'num2', 'num3', 'num4', 'num5', 'num6', 'num7', 'num8', 'num9', 'num.',

    'tilde', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'minus', 'equal', 'backspace',
    'tab', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
    's', 't', 'u', 'v', 'u', 'w', 'x', 'y', 'z', 'comma', 'period', 'slash', 'semicolon',
    'quote', 'open_bracket', 'close_bracket', 'backslash', 'enter', 'shiftright', 'shiftleft',
    'caps', 'winright', 'winleft', 'menu', 'space', 'capslock', 'ctrlleft', 'ctrlright',
    'altleft', 'altright',

    'gamemode', 'capsindicator'
]


while True:
    random.shuffle(keys)
    for key in keys:

        subprocess.call('g810-led -dv 046d -dp c33c -tuk 1 -k ' + key + ' ' + getColor(), shell=True)
        # time.sleep(0.25) # Adds delay between each key color change

    time.sleep(1)
    #subprocess.call('g810-led -dv 046d -dp c33c -tuk 1 -a 000000', shell=True)
