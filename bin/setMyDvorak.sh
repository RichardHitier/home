#!/bin/bash

# change keyboard mapping to a personalized dvorak with
# compose key to allow accentuated chars

/usr/bin/setxkbmap fr
/usr/bin/xmodmap ~/config/misc/myDvorak.xmod 
