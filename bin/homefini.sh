#!/bin/sh

help()
{
    echo $1
    cat << .END
    The help of the $0
.END
}


while getopts "hdl:" flag
do
    case "$flag" in
        d) BIN="echo BIN";;
        h) help;;
        l) 
            exec >> $OPTARG
            exec 2>> $OPTARG
            echo
            echo "-----------------------------"
            date
            echo "-----------------------------"
         ;;
    esac
done

#--------------------------------------------------------------------------------

# what is this distro ?
distro=$(grep '^ID=' /etc/os-release |sed -e 's/.*"\(.*\)"/\1/')

case "$distro" in
    centos|rhel|fedora)
        pm=yum;;
    debian)
        pm=apt-get;;
    *)
        help "Unknown linux distribution $distro";;
esac

echo $distro $pm

# update packages
sudo $pm -y install screen git vim zsh

# change default shell
chsh -s `chsh -l |grep zsh`


# vim tw=0
