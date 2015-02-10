#!/bin/bash
#

if ! test -f paquetes.txt
then
  echo
  echo "Es necesario la existencia del fichero paquetes.txt para iniciar la instalacion"
  echo
  exit
fi

#Actualizamos paquetes
echo "Actualizando paquetes"
apt-get -y update

#Actualizamos sistema
echo "Actualizando sistema"
apt-get -y upgrade
apt-get -y dist-upgrade


#Instalamos lista de paquetes
while read  LINEA
do

  #No si es un comentario
  echo ${LINEA} | grep -q "^#"
  if ! test $? -eq 0
  then
    #echo "apt-get -y install ${LINEA}"
    apt-get -y install ${LINEA}
  fi
  
done < paquetes.txt

