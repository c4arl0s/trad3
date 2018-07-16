#!/bin/bash
# script para agregar una palabra nueva a nuestro diccionario de inglés.

VERDE="\033[47m\033[0;32m\a"
ROJO="\033[47m\033[0;31m\a"
ROJOCLARO="\033[47m\033[0;31m"
ROSA="\033[47m\033[0;35m"
ROSAFONDONEGRO="\033[40m\033[1;35m"
AMARILLO="\033[47m\033[0;33m\a"
BLANCO="\033[1;37m"

directorio_ingles='/Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH'
directorio_espanol='/Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH'
directorio_comodin='/Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY'

imprimir_titulo()
{
	    echo ""
        echo -e "$VERDE 		SCRIPT PARA AGREGAR PALABRAS INGLES-ESPANOL   $AMARILLO  teclea Ctrl-Z salir "
      	echo -e "$ROJO ingrese uno y solo una palabra en INGLES para ingresar a la base de datos: "
      	echo -e "$BLANCO " 
}

obtener_traduccion()
{
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
	read gerundio 
	echo "" 
	echo -e "$AMARILLO ingrese un ejemplo de la palabra a agregar:" 
	echo -e " $VERDE"
    read ejemplo
}

imprimir_traduccion_ingresada()
{
        echo -e " $BLANCO ENGLISH :	$ROSAFONDONEGRO $ingles "
        echo -e " $BLANCO SPANISH :     $ROSAFONDONEGRO $espanol "
        echo -e " $BLANCO EXTRA :       $ROSAFONDONEGRO $algomas "
        echo -e " $BLANCO PAST :        $ROSAFONDONEGRO $p "
        echo -e " $BLANCO PAST PARTICIPE : $ROSAFONDONEGRO $pp "
        echo -e " $BLANCO GERUND :      $ROSAFONDONEGRO   $gerundio "
        echo -e " $BLANCO EXAMPLE : 	$ROSAFONDONEGRO   $ejemplo "
}

crear_archivo_ingles()
{
touch $directorio_ingles/$ingles.txt
}

crear_archivo_espanol()
{
touch $directorio_espanol/$espanol.txt
}

transfiere_traduccion_ingles()
{ 
echo -e "$ingles : $espanol : $algomas : $p : $pp : $gerundio : $ejemplo" >> $directorio_ingles/$ingles.txt
}

transfiere_traduccion_espanol()
{
echo -e "$espanol : $ingles : $algomas : $p : $pp : $gerundio : $ejemplo" >> $directorio_espanol/$espanol.txt
}

#################################################################################################

# The test utility evaluates the expression and, if it evaluates to true, returns a zero (true) exit status; otherwise it returns 1 (false).  If the  no expression, test also returns 2 (false).

while [ "$*" = "" ]  

        do
        imprimir_titulo
      	read ingles

#######################################################################################

	if [ "$ingles" != "" ] #mientras lo que ingreses en la terminal sea vacio, entonces has lo siguiente	

	then 

      	test -f $directorio_ingles/$ingles.txt 

	if [ "$?" = "1" ]	# prueba si la palabra no existe

      	then
		echo ""
		echo "archivo no existe ... se agregara ahora"
        echo ""

        obtener_traduccion

	    echo "confirmacion de la palabra: "
	    echo -e " $BLANCO "
        
        imprimir_traduccion_ingresada

	    echo -e "es correcto ? (teclee ENTER) : "
        echo -e ""
        read confirmacion

        if [ "$confirmacion" = "" ]

        then 
		echo -e "$ROSA         agregando palabra $BLANCO $ingles .... "

        crear_archivo_ingles
        transfiere_traduccion_ingles        
        crear_archivo_espanol
	    transfiere_traduccion_espanol	

	                if [ "$p" = "" ]	# si la palabra no existe
                        then
                        echo -e " - "    
                        else
                        touch $directorio_ingles/$p.txt
                        echo -e "$p es el pasado de $ingles / $espanol : " >> $directorio_ingles/$p.txt
                        fi

                        
	                if [ "$pp" = "" ]	# si la palabra no existe
                        then      
                        echo -e " - "    
                        else
                        touch $directorio_ingles/$pp.txt
                        echo -e "$pp es el pasado participio de $ingles / $espanol : " >> $directorio_ingles/$pp.txt
                        fi


	                if [ "$gerund" = "" ]	# si la palabra no existe
                        then
                        echo -e " - "    
                        else
                        touch $directorio_ingles/$gerund.txt
                        echo -e "$gerund es el gerundio de $ingles / $espanol : " >> $directorio_ingles/$gerund.txt
                    fi

                cat $directorio_ingles/$ingles.txt
                cat $directorio_espanol/$espanol.txt

                                else
                                        echo ""
                                        echo    " confirmacion nula : no se agregara la palabra "

                                fi

	else			
		echo -e "$VERDE"
      		echo "la palabra existe"
            echo -e "$BLANCO"
            cat $directorio_ingles/$ingles.txt
		echo ""
        echo -e "$ROJO"
		echo "¿ desea agregar otro signicado a la palabra [y/n]? "
		echo "¿ o editar archivo [e] ? "
		echo -e " $BLANCO "
		read decision

		case $decision in

		"yes") 	echo -e " $ROJO "
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
				read gerundio 

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
                                echo -e " $BLANCO GERUND :      $VERDE   $gerundio "
                                echo -e " $BLANCO EXAMPLE :     $VERDE   $ejemplo "

				echo -e "es correcto ? (y) [teclea ENTER ] : "
				echo -e ""
				read confirmacion

				if [ "$confirmacion" = "" ]

				then

		echo -e "$ingles : $espanol : $algomas : $p : $pp : $gerundio : $ejemplo" >> $directorio_ingles/$ingles.txt

		chmod 777 $directorio_espanol/$espanol.txt
		echo "" >> $directorio_espanol/$espanol.txt

		echo -e "$espanol : $ingles : $algomas : $p : $pp : $gerundio : $ejemplo" >> $directorio_espanol/$espanol.txt					
		
		sed '/^ *$/d' $directorio_ingles/$ingles.txt
		sed '/^ *$/d' $directorio_espanol/$espanol.txt
				
				else
					echo ""
				    echo	" $BLANCO !!! confirmacion nula : no se agregara la palabra ¡¡¡ "
					
				fi
				;;      		     	
		
        "no") 	echo ""
			echo "dijiste NO";;
		"editar") 	echo ""
			vim $directorio_ingles/$ingles.txt
			vim $directorio_espanol/$espanol.txt
			;;

		*) 	echo "oprime tecla correcta"
			echo "";;
		
		esac

	fi 
	else
		echo ""
	fi	
done
