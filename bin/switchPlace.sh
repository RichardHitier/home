#!/bin/sh


EXIMCONFFILE="/etc/exim4/update-exim4.conf.conf"
RESOLVFILE="/etc/resolv.conf"

#FILEPREFIX="/etc/exim4/update-exim4.conf."
FILEPREFIX="/home/richard/config/etc/exim4/update-exim4.conf."

show()
{
    ls -1 ${FILEPREFIX}*
}

linkNlaunch()
{
    LOCALFILE=${FILEPREFIX}$1
    
    if [ -e $LOCALFILE ]
    then
        #ls -l $LOCALFILE
        ln -fs  $LOCALFILE $EXIMCONFFILE
        /usr/sbin/update-exim4.conf
        /etc/init.d/exim4 restart
    else
        help "naaaaaaaa: $LOCALFILE not present "
    fi
}

help()
{
    echo $1
    cat << .END

$0 Usage:

$0 -h           this help
$0 -s           show all possible extensions
$0 -l <ARG>     link your ARG file to 
.END
}


while getopts "hsl:" flag
do
    case "$flag" in
        h) help;;
        s) show;;
        l) linkNlaunch $OPTARG;;
        *) help;;
    esac
done
