#!/bin/sh
# shell script to be called by It's All Text firefox plugin.
# wrapper for the form text field editor 
set -eu

exec gnome-terminal --geometry 160x60+225+50 -e "vim $@"

