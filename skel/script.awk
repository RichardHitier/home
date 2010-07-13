#!/usr/bin/gawk -f

BEGIN {print "begin"}

/^Host/,/^Spin_Counter/{next}

{
if ( $1 > 100 && $156 != mode) {
    print ($9, $156);
    mode=$156
    }
}

END {print "end"}
