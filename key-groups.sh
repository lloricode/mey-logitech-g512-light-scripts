#!/bin/bash

# Generate random hex RGB value. No # character.
function getColor()
{
   #return hexdump -n 3 -v -e '3/1 "%02X" "\n"' /dev/urandom
   rgb=$(printf "%02x%02x%02x" $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)))
   echo $rgb
}


# Random Colors
colorKeys=$(getColor)
colorFKeys=$(getColor)
colorNumeric=$(getColor)
colorFunctions=$(getColor)
colorModifiers=$(getColor)

# Keys
g810-led -dv 046d -dp c33c -tuk 1 -g fkeys $colorFKeys
g810-led -dv 046d -dp c33c -tuk 1 -g functions $colorFunctions
g810-led -dv 046d -dp c33c -tuk 1 -g numeric $colorNumeric
g810-led -dv 046d -dp c33c -tuk 1 -g arrows $colorFKeys
g810-led -dv 046d -dp c33c -tuk 1 -g keys $colorKeys
g810-led -dv 046d -dp c33c -tuk 1 -g modifiers $colorModifiers
