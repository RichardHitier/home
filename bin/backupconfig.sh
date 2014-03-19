#!/bin/sh

cd ${HOME}

dpkg --get-selections > ./config/misc/dpkg-get-selection
git ci -m "Update selection" ./config/misc/dpkg-get-selection
git push
