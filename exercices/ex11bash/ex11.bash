#!/usr/bin/bash
#Exercice 1.1(bash)

#Check if the directory thumbnail exists
if [ -d "thumbnails" ]; then
  echo "Directory exists"
else #If it doesn't create it
  echo "Directory doesn't exists, create it"
  mkdir thumbnails
fi

#for every jpeg file
for file in *.jpeg; do
  filename=$(echo ${file%.*})  #Get the name without extention
  check_jpeg=$(file $file | grep ": JPEG image data")  #Check if the file is a JPEG before convert
  if [ ! -z "$check_jpeg" ]; then #If the var with the grep output isn't empty, its a JPEG
    convert $file -resize 100x100! thumbnails/$filename\_100x100.png #Convert, resize, rename and export to the directory
  else #If the var is empty it is not a jpeg, the file isn't converted
    echo "Warning : $file is not a JPEG file !"
  fi
done

echo "Exit"
