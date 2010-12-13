body="salut, on peut se voir dans la journée ou déjeuner ensemble"
subject="`date +"%A %d/%m %T"`: je suis là"
dest="cedric.hillembrand@cesr.fr alain.barthe@cesr.fr vincent.genot@cesr.fr"
#dest="groz@free.fr richard.hitier@co-libri.org"
echo "$body" | mutt -s "$subject" $dest
echo "mailCops.sh done"
