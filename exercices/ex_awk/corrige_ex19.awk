#!/usr/bin/awk -f

#Definitions des separateurs de champs et de lignes
BEGIN{
  FS=" ";
  RS="\n";

  nb_exam=4;

  for(i=0;i<nb_exam;i++){
    nb_eleves_a_exam_i[i]=0;
    sum_notes_exam[i]=0;
  }

}

#Ce bloc va être appliqué à toutes les lignes (tous les élèves)
{
  for(i=0;i<nb_exam;i++){ #Pour touts les exams
    if($(i+3)!="abs"){  #Si la note à l'exam n'est pas abs on procède aux changements des valeurs, sinon on ne fait rien. Le +3 sert à ce décaler car les premiers champs sont les noms et ids
      nb_eleve_a_exam_i[i]=nb_eleve_a_exam_i[i]+1; #Si cet élève n'est pas absent on augmente le compteur et la somme des notes pour cet examen
      sum_notes_exam[i]=sum_notes_exam[i]+$(i+3); 
#      printf "note exam "i" : "$(i+3)". nb eleve à l'exam : "nb_eleve_a_exam_i[i]  ". somme des notes : " sum_notes_exam[i] ".\n"  #Cette ligne si tu la décommente te permettera de voir l'evolution des valeurs de chacune des variables pour mieu comprendre.
    }
  }
}

/abs/{
  abs_counter=0;
  for(k=0;k<nb_exam;k++){
    if($(k+3)=="abs"){
      abs_counter++;
    }
  }
  printf $1"/"$2" : "abs_counter" absence(s)\n"
}



#End Block Une fois toutes les opérations effectuées pour chacun des eleves.
END{
#version tableau
  for(i=0;i<nb_exam;i++){
    if(nb_eleve_a_exam_i[i]!=0){
      moy_exam_i[i]=sum_notes_exam[i]/nb_eleve_a_exam_i[i];
      printf "moyenne à l'examen "i" : "moy_exam_i[i]" " ;
    }else{
      printf "Aucun élève présent à cet examen\n"
    }
   for(j=0;j<moy_exam_i[i];j++){
    printf "*"
  }
  printf "\n"
  }  
  exit 0;
}

#version sans tableau
#  for(i=0;i<nb_exam;i++){
#    if(nb_eleve_a_exam_i[i]!=0){
#      printf "moyenne à l'examen "i" : "sum_notes_exam[i]/nb_eleve_a_exam_i[i]"\n" ;
#    }else{
#      printf "Aucun élève présent à cet examen\n"
#    }
#   for(j=0;j<sum_notes_exam[i]/nb_eleve_a_exam_i[i];j++){
#    printf "*"
#  }
#  printf "\n"
#  } 
 

