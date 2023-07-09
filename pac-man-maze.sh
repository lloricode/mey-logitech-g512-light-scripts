#!/usr/bin/env python3

import subprocess, time

MAZE_COLOR = '6964DD'
GHOST_COLOR = 'ff0000'
PACMAN_COLOR = 'DDBA64'
POWER_PELLET_COLOR = 'ffffff'
DOT_COLOR = 'EDEDBF'


# Set maze border colors
subprocess.call('g810-led -dv 046d -dp c33c -tuk 1 -a ' + MAZE_COLOR, shell=True)


# Set dot pattern
dots = [
'tilde', '1', '2', '3', '4', '5', 'f4', 'f5', '7', 'u', 'i', 'k', 'l', 'semicolon',
'p', '0', '9', 'f7', 'f8', 'f9', 'minus', 'equal', 'backspace', 'backslash',
'del', 'insert', 'home', 'pageup', 'pagedown', 'num7', 'numlock', 'numslash', 'numasterisk',
'numminus', 'numplus', 'num3', 'num2', 'num1', 'num0', 'right', 'top', 'left', 'ctrlright',
'ctrlright', 'shiftright', 'slash', 'period', 'altright', 'space', 'n', 'b', 'g', 'f', 'd',
'c', 'x', 's', 'a', 'caps', 'shiftleft', 'ctrlleft',

]


for dot in dots:
    subprocess.call('g810-led -dv 046d -dp c33c -tuk 1 -k ' + dot + ' ' + DOT_COLOR, shell=True)


path = dots


# Set power pellet
subprocess.call('g810-led -dv 046d -dp c33c -tuk 1 -k ctrlleft ' + POWER_PELLET_COLOR, shell=True)


for place in path:
subprocess.call('g810-led -dv 046d -dp c33c -tuk 1 -k ' + place + ' ' + PACMAN_COLOR, shell=True)
time.sleep(0.10)

# Dot gobbled
subprocess.call('g810-led -dv 046d -dp c33c -tuk 1 -k ' + place + ' 000000', shell=True)

# Set final
subprocess.call('g810-led -dv 046d -dp c33c -tuk 1 -a ' + MAZE_COLOR, shell=True)

keyset = [
'w', 'a', 's', 'd', 'enter', 'f9', 'scrolllock', 'pause'
]


# Modifier keys
subprocess.call('g810-led -dv 046d -dp c33c -tuk 1 -g modifiers DDBA64', shell=True)

# function key
subprocess.call('g810-led -dv 046d -dp c33c -tuk 1 -k winright ' + MAZE_COLOR, shell=True)

for key in keyset:
    subprocess.call('g810-led -dv 046d -dp c33c -tuk 1 -k ' + key + ' DDBA64', shell=True)
