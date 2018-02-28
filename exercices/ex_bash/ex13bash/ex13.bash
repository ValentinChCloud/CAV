#!/usr/bin/bash
#ex13(bash), ecrire fichier poids-age.dat2 a partir de poids-age.dat1

echo "poids age" > poids-age.dat2
#Solution1
cut -d: -f2,3 poids-age.dat1 | sed 's/[^0-9]/ /g' >>poids-age.dat2
#Solution2
#tr "," ":" <poids-age.dat1 | tr ":" " " | cut -d" "  -f 2,4 >>poids-age.dat2

#Trie
sort -n -k2 poids-age.dat2 >poids-age.dat3
