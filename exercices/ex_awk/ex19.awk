#!/usr/bin/awk -f

#Definitions des separateurs de champs et de lignes
BEGIN{
  FS=" ";
  RS="\n";
  }

#Ce bloc va être appliqué à toutes les lignes (tous les élèves)
{

  #Déclaration des variables
  id=$1;
  name=$2;
  nb_exams=NF-2; #Le nombre d'éxam est égal au nombre de champs NF (Number of Field) moins 2 (Identifiant et nom)
  compteur_abs=0; #Initiation du compteur d'absences à 0 pour chacun des élèves
  sum_notes_exam=0;  #Initialisation de la somme des notes pour le calcul de la moyenne
 
  for(i=2;i<=NF;i++){ #Parcour des champs à partir du 3e jusqu'au dernier
    if ($i=="abs"){ #Si absence incrémenter le compteur d'absence
      compteur_abs++;
    }else{ #Sinon ajouter la note à la somme des notes
      sum_notes_exam=sum_notes_exam+$i;
    }     
  }
  moy=sum_notes_exam/nb_exams #La moyenne est égale à la somme des notes / le nombre d'exam
  
  #Impression des réultats 
  printf "Eleve : " id " " name ", nb absence : " compteur_abs ", moyenne : "moy" "
  #Boucle pour afficher n=moyenne fois le charactere *
  for(i=0;i<moy;i++){
    printf "*"
  }
  printf "\n"

}

#End Block
END{
  print "\nExit";
  exit 0;
}


##Remarques sur le code : 
# Tu vois que chacune des information est stockée dans une variable ce qui permet d'être plus flexible. Par exemple si un élève a passé plus d'examens que les autres le calcul de moyenne sera toujours bon car on ne note pas "moy=sum_notes_exam/4" mais on utilise "nb_exam" qui est calculé pour chaque élève.

# Si il y a un champs qui n'est ni une note ni "abs" il y aura surement une erreur.
# Une absence est ici considéré comme un zéro. Pour ne pas compter un exam quand absence, il faut décrémenter autant de fois nb_exam qu'il y a d'absence.
