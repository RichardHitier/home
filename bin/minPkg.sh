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


cd $HOME
tar czf minPkg.tgz .vim .vimrc .zshrc .zshenv .oh-my-zsh/ .screenrc .gitconfig 

echo "ok, created $HOME/minPkg.tgz"
