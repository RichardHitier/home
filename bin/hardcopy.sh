#!/bin/sh


help()
{
    echo 
    echo '   Error: '$1
    cat << .END

    $0 prints source code to pdf file
    needs vim and ps2pdf
    Usage:
        $0 source.file
    Outputs:
        source.file.pdf

.END
}

which vim 2>&1 > /dev/null || { help "please, install vim" ; exit ;}
which ps2pdf 2>&1 > /dev/null  || { help "please, install ps2pdf" ; exit ;}
[ 'x' = 'x'$1 ] && help "please, give file as arg" && exit

input=$1

[  -e $input ] || { help "wrong file "$input; exit; }

#exit

baseInput=$(pwd)/$(basename ${input})
outputPS=${baseInput}.ps
outputPDF=${baseInput}.pdf

vim -c 'hardcopy >  '$outputPS -c quit $input

ps2pdf  $outputPS $outputPDF
rm $outputPS
#
output=$outputPDF
echo 'Ok, written to '$output
