# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#


if [ -f ~/CalipsoProject/env.sh ]; then
    . ~/CalipsoProject/env.sh
fi

if [ -f ~/.rcdir/profile ]; then
    . ~/.rcdir/profile
fi
