#!/usr/bin/awk -f

#Fields definition
BEGIN{
  FS="|";
  RS="\n";
 
  LEN_TOT=0;
  LOCUS="unknown"
  DEFINITION="unknown";
  ACCESSION="unknown";
  FEATURES="Location/Qualifiers"
  line="";
  all_lines="";
}

#Check first character, it should be > in a fasta file
NR==1{
  char1=substr($1,1,1);

  if (char1!=">"){ #Not valid exit program
    print "Not a valid fasta file";
    exit 1;
  }else{ #Valid fasta
  LOCUS=substr($1"|"$2"|"$3"|"$4,2); 
  DEFINITION=$5;
  }
}

NR>1{
  len_current_line=length;
  LEN_TOT=LEN_TOT+len_current_line;

  line_split="";

  for(i=1; i<=60; i+=10) {line_split=line_split""substr($0,i,10)" ";}
  line="\t"(1+LEN_TOT-60)"\t"line_split;
  all_lines=all_lines"\n"line;
}

#End Block
END{
  print " LOCUS\t"LOCUS"\t"LEN_TOT" aa";
  print "DEFINITION\t" DEFINITION;
  print "ACCESSION\t" ACCESSION;
  print "FEATURES\t" FEATURES;
  print "ORIGIN";
  print all_lines;
  print "//\n";
  exit 0;
}
