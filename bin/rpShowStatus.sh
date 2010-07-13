#!/bin/sh
# shell script to be called by ratpoison for battery state display

msg=`acpi`

ratpoison -c "echo ${msg}"
