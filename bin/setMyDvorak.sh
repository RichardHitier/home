#!/bin/bash

# change keyboard mapping to a personalized dvorak with
# compose key to allow accentuated chars

/usr/bin/setxkbmap us_intl
/usr/bin/xmodmap ~/config/misc/myDvorak.xmod 
