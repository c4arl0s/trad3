#!/bin/bash

# script para agregar una palabra nueva a nuestro diccionario de ingles.

# variables que definen una secuencia de caracteres correspondientes a una impresion en color
# con un beeb en cada transicion


VERDE="\033[47m\033[0;32m\a"
ROJO="\033[47m\033[0;31m\a"
ROJOCLARO="\033[47m\033[0;31m"

ROSA="\033[47m\033[0;35m"
ROSAFONDONEGRO="\033[40m\033[1;35m"

AMARILLO="\033[47m\033[0;33m\a"

BLANCO="\033[1;37m"

#################################################################################################

# The test utility evaluates the expression and, if it evaluates to true, returns a zero (true) exit status; otherwise it returns 1 (false).  If the  no expression, test also returns 2 (false).

while [ "$*" = "" ]  

        do

	echo ""
        echo -e "$VERDE 		SCRIPT PARA AGREGAR PALABRAS INGLES-ESPANOL   $AMARILLO  teclea Ctrl-Z salir "
      	echo -e "$ROJO ingrese uno y solo una palabra en INGLES para ingresar a la base de datos: "
      	echo -e " $BLANCO " 
      	read ingles

#######################################################################################

	if [ "$ingles" != "" ] #mientras lo que ingreses en la terminal sea vacio, entonces has lo siguiente	

	then 

      	test -f /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$ingles.txt 

	if [ "$?" = "1" ]	# si la palabra no existe

      	then
		echo ""
		echo "archivo no existe ... se agregara ahora"

	echo "" 
	echo -e "$AMARILLO ingrese palabra uno y solo una en ESPANOL:" 
	echo -e " $ROSAFONDONEGRO "
	 
	read espanol 

	echo "" 
	echo -e "$AMARILLO ingrese algo extra acerca de tu palabra:" 
	echo -e " $VERDE " 
	read algomas 

	echo "" 
	echo -e "$AMARILLO ingrese PASADO en caso de ser verbo:" 
	echo -e " $VERDE " 
	read p 

	echo "" 
	echo -e "$AMARILLO ingrese PASASO PARTICIPIO en caso de ser verbo:" 
	echo -e " $VERDE " 
	read pp 

	echo "" 
	echo -e "$AMARILLO ingrese GERUNDIO en caso de ser verbo:" 
	echo -e " $VERDE " 
	read gerund 

	echo "" 
	echo -e "$AMARILLO ingrese un ejemplo de la palabra a agregar:" 
	echo -e " $VERDE" 
	read ejemplo

	echo "confirmacion de la palabra: "
	echo -e " $BLANCO "

        echo -e " $BLANCO ENGLISH :	$ROSAFONDONEGRO $ingles "
        echo -e " $BLANCO SPANISH :     $ROSAFONDONEGRO $espanol "
        echo -e " $BLANCO EXTRA :       $ROSAFONDONEGRO $algomas "
        echo -e " $BLANCO PAST :        $ROSAFONDONEGRO $p "
        echo -e " $BLANCO PAST PARTICIPE : $ROSAFONDONEGRO $pp "
        echo -e " $BLANCO GERUND :      $ROSAFONDONEGRO   $gerund "
	echo -e " $BLANCO EXAMPLE : 	$ROSAFONDONEGRO   $ejemplo "

	echo -e "es correcto ? (teclee ENTER) : "
        echo -e ""
        read confirmacion

                if [ "$confirmacion" = "" ]

                then
 
				
		echo -e "$ROSA         agregando palabra $BLANCO $ingles .... "
 
	        touch /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$ingles.txt
        	echo -e "$ingles : $espanol : $algomas : $p : $pp : $gerund : $ejemplo" >> /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$ingles.txt
		touch /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$espanol.txt
		echo -e "$espanol : $ingles : $algomas : $p : $pp : $gerund : $ejemplo" >> /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$espanol.txt
		

	                if [ "$p" = "" ]	# si la palabra no existe
                        then
                        echo -e " there's no such thing"    
                        else
                        touch /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$p.txt
                        echo -e "$p es el pasado de $ingles / $espanol " >> /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$p.txt
                        fi

                        
	                if [ "$pp" = "" ]	# si la palabra no existe
                        then      
                        echo -e " there's no such thing"    
                        else
                        touch /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$pp.txt
                        echo -e "$pp es el pasado participio de $ingles / $espanol " >> /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$pp.txt
                        fi


	                if [ "$gerund" = "" ]	# si la palabra no existe
                        then
                        echo -e " there's no such thing"    
                        else
                        touch /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$gerund.txt
                        echo -e "$gerund es el gerundio de $ingles / $espanol " >> /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$gerund.txt
                        fi
                
                #remueve las lineas vacias al inicio del fichero
        	#sed '/^ *$/d' /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$ingles.txt   
		#sed '/^ *$/d' /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$espanol.txt

                cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$ingles.txt
                cat /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$espanol.txt

                                else
                                        echo ""
				#	rm /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/$ingles.txt
                                        echo    " confirmacion nula : no se agregara la palabra "

                                fi

	else			
		echo -e "$VERDE"
      		echo "la palabra existe" 
		echo ""
		echo "¿ desea agregar otro signicado a la palabra [y/n]? "
		echo "¿ o editar archivo [e] ? "
		echo -e " $BLANCO "
		read decision

		case $decision in

		"y") 	echo -e " $ROJO "
			echo "dijiste YES"
				echo "" 
				echo -e "$AMARILLO ingrese palabra uno y solo una en ESPANOL:" 
				echo -e " $BLANCO " 
				read espanol 

				echo "" 
				echo -e "$AMARILLO ingrese algo extra acerca de tu palabra:" 
				echo -e " $BLANCO " 
				read algomas 

				echo "" 
				echo -e "$AMARILLO ingrese PASADO en caso de ser verbo:" 
				echo -e " $BLANCO " 
				read p 

				echo "" 
				echo -e "$AMARILLO ingrese PASASO PARTICIPIO en caso de ser verbo:" 
				echo -e " $BLANCO " 
				read pp 

				echo "" 
				echo -e "$AMARILLO ingrese GERUNDIO en caso de ser verbo:" 
				echo -e " $BLANCO " 
				read gerund 

				echo "" 
				echo -e "$AMARILLO ingrese un ejemplo de la palabra a agregar:" 
				echo -e " $BLANCO " 
				read ejemplo
	 
				echo "confirmacion de la palabra: "

                                echo -e " $BLANCO "

                                echo -e " $BLANCO ENGLISH :     $VERDE $ingles "
                                echo -e " $BLANCO SPANISH :     $VERDE $espanol "
                                echo -e " $BLANCO EXTRA :       $VERDE $algomas "
                                echo -e " $BLANCO PAST :        $VERDE $p "
                                echo -e " $BLANCO PAST PARTICIPE : $VERDE $pp "
                                echo -e " $BLANCO GERUND :      $VERDE   $gerund "
                                echo -e " $BLANCO EXAMPLE :     $VERDE   $ejemplo "

				echo -e "es correcto ? (y) [teclea ENTER ] : "
				echo -e ""
				read confirmacion

				if [ "$confirmacion" = "" ]

				then

		echo -e "$ingles : $espanol : $algomas : $p : $pp : $gerund : $ejemplo" >> /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$ingles.txt

		chmod 777 /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$espanol.txt
		echo "" >> /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$espanol.txt

		echo -e "$espanol : $ingles : $algomas : $p : $pp : $gerund : $ejemplo" >> /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$espanol.txt					
		
		sed '/^ *$/d' /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$ingles.txt
		sed '/^ *$/d' /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$espanol.txt
				
				else
					echo ""
				        echo	" $BLANCO !!! confirmacion nula : no se agregara la palabra ¡¡¡ "
					
				fi
				;;      		     	
		"n") 	echo ""
			echo "dijiste NO";;
		"e") 	echo ""
			vim /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$ingles.txt
			vim /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH/$espanol.txt
			;;

		*) 	echo "oprime tecla correcta"
			echo "";;
		
		esac

	fi 
	else
		echo ""
	fi	
done
