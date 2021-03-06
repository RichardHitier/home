#!/bin/bash

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

# For each photo from source directory
# Read creation date from EXIF
# Move to new path in destination directory

function error
{
    echo $@
    return 0
}
export -f error

function showdate
{
    imageFile=$0
    [ -e $imageFile ] || error $imageFile "doesent exist"
    baseImageFile=`basename ${imageFile}`
    exifFile=${baseImageFile}.exif
    exif -t DateTimeOriginal ${imageFile} 2>/dev/null > ${exifFile} || error "No exif for "${imageFile}
    destDir=`grep Value ${exifFile} | sed -e 's#.*\(....\):\(..\):.. .*#\1/\2#'`
    rm ${exifFile}
    [ -d ${destDir} ] || mkdir -p ${destDir}
    destImageFile=${destDir}/${baseImageFile}
    [ -e ${destImageFile} ] && error ${destImageFile} exists
    cp ${imageFile} ${destImageFile}

}

export -f showdate


patterns='jpg|JPG'
find -regextype posix-extended -regex '.*\.(jpg|png|JPG|JPEG|CR2)' -exec bash -c showdate '{}' \;

# vim: tw=0
