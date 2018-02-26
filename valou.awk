#! /usr/bin/awk -f
BEGIN{
cpt=1
g=1
cptg=1
LEN_TOT =0
}

NR==1{
    FS=" "
    print "LOCUS : " $1 "and length tot" LEN_TOT "aa" 
    print "DEFINITON: "
    FS=""
    next
}
NR>1{
   FS=""
   ORS=""
   OFS=""
   if (NR ==2){
	print cptg" "
   }
   for (i = 1 ; i<=NF; i++){	
	if(g < 11){
        	print $i
        }else{
		cpt=cpt+1
		g=1
		if(cpt < 6){
                        print " "$i 
		}else{
			cpt=1
			print "\n"cptg" "$i	
		}
        }  
    cptg=cptg+1
    g=g+1
   }
} 
   

