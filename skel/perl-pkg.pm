package Package;
use strict;
use Exporter;
our @ISA=('Exporter');
our @EXPORT=qw(&Func @Table $Var %Hash);

BEGIN{ print "Initialisations ...\n";}


# . . . . . . . . . . 


END{ print "Cleanings ... \n";}
1;
