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

input=$1

which vim 2>&1 > /dev/null || { help "please, install vim" ; exit ;}
which ps2pdf 2>&1 > /dev/null  || { help "please, install ps2pdf" ; exit ;}
[ 'x' = 'x'$input ] && help "please, give file as arg" && exit
[  -e $input ] || { help "wrong file "$input; exit; }

baseInput=$(pwd)/$(basename ${input})
outputPS=${baseInput}.ps
outputPDF=${baseInput}.pdf

vim -c 'hardcopy >  '$outputPS -c quit $input

ps2pdf  $outputPS $outputPDF
rm $outputPS

output=$outputPDF
clear
echo 'Ok, written to '$output
