#!/bin/bash

# busca una palabra en el diccionario de ingles local

# variables que definen una secuencia de caracteres correspondientes a una impresion en color
# con un beeb en cada transicion

VERDE="\033[47m\033[0;32m\a"
ROJO="\033[47m\033[0;31m\a"
ROJOCLARO="\033[47m\033[0;31m"
ROSA="\033[47m\033[0;35m"
ROSAFONDONEGRO="\033[40m\033[1;35m"
CYAN="\033[40m\033[36m" 
AMARILLO="\033[47m\033[0;33m\a"
BLANCO="\033[1;37m"

######### Declaracion de Funciones ###############3

imprimir_buscar_palabra()
{
        echo -e ""
	echo -e "$ROJO --------------------------------------------------------------------------"
	echo -e "$BLANCO 	BUSCAR PALABRA: (ingresa palabra en español o inglés) " 
	echo -e "$ROJO --------------------------------------------------------------------------"   
}

#########  Fin de declaración de funciones  ###########

##### INICIA PROFGRAMA PRINCIPAL ################

while ["$*" != ""] # mientras todos los parametros $* que le pones al script sea diferente de nada, haz lo que hay acontinuacion.
do
        imprimir_buscar_palabra
	
        read palabra

	test -f /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$palabra.txt
 
	if [ "$?" = 0 ]	        

	then	echo ""	
		echo -e "$CYAN $palabra existe ..."
		echo ""

                # sed '/^ *$/d' file
                # Delete all lines which are empty or which contains just some blank spaces:
                #  '*' indicates 0 or more occurrences of the previous character. 
                #  '^ *$' indicates a line containing zero or more spaces. 
                # Hence, this will delete all lines which are either empty or lines with only some blank spaces.

		sed '/^ *$/d' /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$palabra.txt > /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/comodin.txt
		cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/comodin.txt > /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$palabra.txt

			
		n=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$palabra.txt | wc -l | cut -f 8 -d " "`
		
		echo -e " tiene $n numeros de lineas el archivo $palabra.txt"	
		echo ""

                # INICIA UN FOR

		for i in `seq $n`	# hace una accion desde i hasta n
		
		#for i in $n     # hace una accion desde i hasta n

		do
		#	echo -e "haz esto $i "

	 INGLES=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$palabra.txt | tail -$i  | cut -f 1 -d ":"`
	ESPANOL=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$palabra.txt | tail -$i  | cut -f 2 -d ":"`
	  EXTRA=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$palabra.txt | tail -$i  | cut -f 3 -d ":"`
	      P=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$palabra.txt | tail -$i  | cut -f 4 -d ":"`
             PP=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$palabra.txt | tail -$i  | cut -f 5 -d ":"`
              G=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$palabra.txt | tail -$i  | cut -f 6 -d ":"`
              E=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$palabra.txt | tail -$i  | cut -f 7 -d ":"`

		echo -e "$BLANCO"
                echo -e "$INGLES --> $ROSAFONDONEGRO $ESPANOL"
                echo -e ""
                echo -e "$BLANCO Extra: $VERDE $EXTRA"
                echo -e "$BLANCO Past: $VERDE $P" 
                echo -e "$BLANCO Past Participe: $VERDE $PP"
                echo -e "$BLANCO Gerund: $VERDE $G"
                echo -e "$BLANCO Example: $VERDE $E"


		done
		
	else
                # si no existe la palabra en ingles ahora revisa si es una palabra en español

		 test -f /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$palabra.txt	
	
		if [ "$?" = 0 ]
		
		then
			echo ""
                	echo -e "$CYAN $palabra existe ..."
                	echo ""

                sed '/^ *$/d' /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$palabra.txt > /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/comodin.txt
                
                cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/comodin.txt > /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$palabra.txt


                n=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$palabra.txt | wc -l | cut -f 8 -d " "`

                echo -e " tiene $n numeros de lineas el archivo $palabra.txt"
                echo ""

                for i in `seq $n`       # hace una accion desde i hasta n

                #for i in $n     # hace una accion desde i hasta n

                do
                #       echo -e "haz esto $i "

         INGLES=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$palabra.txt | tail -$i  | cut -f 1 -d ":"`
        ESPANOL=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$palabra.txt | tail -$i  | cut -f 2 -d ":"`
          EXTRA=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$palabra.txt | tail -$i  | cut -f 3 -d ":"`
              P=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$palabra.txt | tail -$i  | cut -f 4 -d ":"`
             PP=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$palabra.txt | tail -$i  | cut -f 5 -d ":"`
              G=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$palabra.txt | tail -$i  | cut -f 6 -d ":"`
              E=`cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$palabra.txt | tail -$i  | cut -f 7 -d ":"`

                echo -e "$BLANCO"
                echo -e "$INGLES --> $ROSAFONDONEGRO $ESPANOL"
                echo -e ""
                echo -e "$BLANCO Extra: $VERDE $EXTRA"
                echo -e "$BLANCO Past: $VERDE $P" 
                echo -e "$BLANCO Past Participe: $VERDE $PP"
                echo -e "$BLANCO Gerund: $VERDE $G"
                echo -e "$BLANCO Example: $VERDE $E"

                done


		else
			echo ""
			echo -e "$AMARILLO $palabra no existe en la base de datos!"

		fi
			

#		echo -e "$ROJO"
#		echo -e "no se encuentra la palabra buscada"
		
	fi
	

done


