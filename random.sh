#!/bin/bash


function getColor()
{
    rgb=$(printf "%02x%02x%02x" $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)))
    echo $rgb
}


# Define colors
COLOR1=$(getColor)
COLOR2=$(getColor)


# Save to colors log
echo "$(date): $COLOR1 $COLOR2" >> ~/etc/keycolors.txt

arrKeys=('esc'

# Function F1-F12
'f1' 'f2' 'f3' 'f4' 'f5' 'f6' 'f7' 'f8' 'f9' 'f10' 'f11' 'f12'

# Print Screen Scroll Lock Pause
'printscr' 'scrolllock' 'pause'

'ins' 'del' 'home' 'end' 'pageup' 'pagedown'

# Arrow keys
'top' 'right' 'bottom' 'left'

# Numpad
'numlock' 'numslash' 'numasterisk' 'numminus' 'numplus' 'numenter'
'num0' 'num1' 'num2' 'num3' 'num4' 'num5' 'num6' 'num7' 'num8' 'num9' 'num.'

'tilde' '1' '2' '3' '4' '5' '6' '7' '8' '9' '0' 'minus' 'equal' 'backspace'
'tab' 'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r'
's' 't' 'u' 'v' 'u' 'w' 'x' 'y' 'z' 'comma' 'period' 'slash' 'semicolon'
'quote' 'open_bracket' 'close_bracket' 'backslash' 'enter' 'shiftright' 'shiftleft'
'caps' 'winright' 'winleft' 'menu' 'space' 'capslock' 'ctrlleft' 'ctrlright'
'altleft' 'altright'

'gamemode' 'capsindicator')

# Set all keys to off in case of "stuck" key colors
g810-led -dv 046d -dp c33c -tuk 1 -a 000000


# Light each key in array with each other COLOR1 or COLOR2
for key in ${arrKeys[*]}
do
    if [ $((RANDOM % 2)) == 1 ]
    then
        g810-led -dv 046d -dp c33c -tuk 1 -k $key "$COLOR1"
    else
        g810-led -dv 046d -dp c33c -tuk 1 -k $key "$COLOR2"
    fi
done
