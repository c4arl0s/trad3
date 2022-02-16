#!/bin/bash
# script to add new english words to my personal dictionary

. ./helper-functions/colors.sh
. ./helper-functions/directoryPaths.sh
. ./add-functions/functions.sh

# obtener_traduccion()
# {
#     echo -e "$YELLOW ingrese palabra uno y solo una en ESPANOL:" 
#     echo -e " $ROSAFONDONEGRO "
#     read SPANISH 
#     echo "" 
#     echo -e "$YELLOW ingrese algo extra acerca de tu palabra:"
#     echo -e " $GREEN "
#     read SOMETHINGELSE 
#     echo "" 
#     echo -e "$YELLOW ingrese PASADO en caso de ser verbo:" 
#     echo -e " $GREEN " 
#     read PAST 
#     echo "" 
#     echo -e "$YELLOW ingrese PASASO PARTICIPIO en caso de ser verbo:" 
#     echo -e " $GREEN " 
#     read PASTPARTICIPE 
#     echo "" 
#     echo -e "$YELLOW ingrese GERUNDIO en caso de ser verbo:" 
#     echo -e " $GREEN " 
#     read GERUND 
#     echo "" 
#     echo -e "$YELLOW ingrese un ejemplo de la palabra a agregar:" 
#     echo -e " $GREEN"
#     read EXAMPLE
# }

imprimir_traduccion_ingresada()
{
    echo -e " $WHITE ENGLISH :	$ROSAFONDONEGRO $ingles "
    echo -e " $WHITE SPANISH :     $ROSAFONDONEGRO $SPANISH "
    echo -e " $WHITE EXTRA :       $ROSAFONDONEGRO $SOMETHINGELSE "
    echo -e " $WHITE PAST :        $ROSAFONDONEGRO $PAST "
    echo -e " $WHITE PAST PARTICIPE : $ROSAFONDONEGRO $PASTPARTICIPE "
    echo -e " $WHITE GERUND :      $ROSAFONDONEGRO   $GERUND "
    echo -e " $WHITE EXAMPLE : 	$ROSAFONDONEGRO   $EXAMPLE "
}

crear_archivo_ingles()
{
    touch $ENGLISH_DIRECTORY_PATH/$ingles.txt
}

crear_archivo_espanol()
{
    touch $SPANISH_DIRECTORY_PATH/$SPANISH.txt
}

transfiere_traduccion_ingles()
{ 
    echo -e "$ingles : $SPANISH : $SOMETHINGELSE : $PAST : $PASTPARTICIPE : $GERUND : $EXAMPLE" >> $ENGLISH_DIRECTORY_PATH/$ingles.txt
}

transfiere_traduccion_espanol()
{
    echo -e "$SPANISH : $ingles : $SOMETHINGELSE : $PAST : $PASTPARTICIPE : $GERUND : $EXAMPLE" >> $SPANISH_DIRECTORY_PATH/$SPANISH.txt
}

#################################################################################################

# The test utility evaluates the expression and, if it evaluates to true, returns a zero (true) exit status; otherwise it returns 1 (false).  If the  no expression, test also returns 2 (false).

while [ "$*" = "" ]  

        do
        printHeader
      	read ingles

#######################################################################################

	if [ "$ingles" != "" ] #mientras lo que ingreses en la terminal sea vacio, entonces has lo siguiente	

	then 

      	test -f $ENGLISH_DIRECTORY_PATH/$ingles.txt 

	if [ "$?" = "1" ]	# prueba si la palabra no existe

      	then
		echo ""
		echo "archivo no existe ... se agregara ahora"
        echo ""

        readInputs

	    echo "confirmacion de la palabra: "
	    echo -e " $WHITE "
        
        imprimir_traduccion_ingresada

	    echo -e "es correcto ? (teclee ENTER) : "
        echo -e ""
        read confirmacion

        if [ "$confirmacion" = "" ]

        then 
		echo -e "$ROSA         agregando palabra $WHITE $ingles .... "

        crear_archivo_ingles
        transfiere_traduccion_ingles        
        crear_archivo_espanol
	    transfiere_traduccion_espanol	

	                if [ "$PAST" = "" ]	# si la palabra no existe
                        then
                        echo -e " - "    
                        else
                        touch $ENGLISH_DIRECTORY_PATH/$PAST.txt
                        echo -e "$PAST es el pasado de $ingles / $SPANISH : " >> $ENGLISH_DIRECTORY_PATH/$PAST.txt
                        fi

                        
	                if [ "$PASTPARTICIPE" = "" ]	# si la palabra no existe
                        then      
                        echo -e " - "    
                        else
                        touch $ENGLISH_DIRECTORY_PATH/$PASTPARTICIPE.txt
                        echo -e "$PASTPARTICIPE es el pasado participio de $ingles / $SPANISH : " >> $ENGLISH_DIRECTORY_PATH/$PASTPARTICIPE.txt
                        fi


	                if [ "$gerund" = "" ]	# si la palabra no existe
                        then
                        echo -e " - "    
                        else
                        touch $ENGLISH_DIRECTORY_PATH/$gerund.txt
                        echo -e "$gerund es el gerundio de $ingles / $SPANISH : " >> $ENGLISH_DIRECTORY_PATH/$gerund.txt
                    fi

                cat $ENGLISH_DIRECTORY_PATH/$ingles.txt
                cat $SPANISH_DIRECTORY_PATH/$SPANISH.txt

                                else
                                        echo ""
                                        echo    " confirmacion nula : no se agregara la palabra "

                                fi

	else			
		echo -e "$GREEN"
      		echo "la palabra existe"
            echo -e "$WHITE"
            cat $ENGLISH_DIRECTORY_PATH/$ingles.txt
		echo ""
        echo -e "$RED"
		echo "¿ desea agregar otro signicado a la palabra [y/n]? "
		echo "¿ o editar archivo [e] ? "
		echo -e " $WHITE "
		read decision

		case $decision in

		"yes") 	echo -e " $RED "
			echo "dijiste YES"

				echo "" 
				echo -e "$YELLOW ingrese palabra uno y solo una en ESPANOL:" 
				echo -e " $WHITE " 
				read SPANISH 

				echo "" 
				echo -e "$YELLOW ingrese algo extra acerca de tu palabra:" 
				echo -e " $WHITE " 
				read SOMETHINGELSE 

				echo "" 
				echo -e "$YELLOW ingrese PASADO en caso de ser verbo:" 
				echo -e " $WHITE " 
				read PAST 

				echo "" 
				echo -e "$YELLOW ingrese PASASO PARTICIPIO en caso de ser verbo:" 
				echo -e " $WHITE " 
				read PASTPARTICIPE 

				echo "" 
				echo -e "$YELLOW ingrese GERUNDIO en caso de ser verbo:" 
				echo -e " $WHITE " 
				read GERUND 

				echo "" 
				echo -e "$YELLOW ingrese un ejemplo de la palabra a agregar:" 
				echo -e " $WHITE " 
				read EXAMPLE
	 
				echo "confirmacion de la palabra: "

                                echo -e " $WHITE "

                                echo -e " $WHITE ENGLISH :     $GREEN $ingles "
                                echo -e " $WHITE SPANISH :     $GREEN $SPANISH "
                                echo -e " $WHITE EXTRA :       $GREEN $SOMETHINGELSE "
                                echo -e " $WHITE PAST :        $GREEN $PAST "
                                echo -e " $WHITE PAST PARTICIPE : $GREEN $PASTPARTICIPE "
                                echo -e " $WHITE GERUND :      $GREEN   $GERUND "
                                echo -e " $WHITE EXAMPLE :     $GREEN   $EXAMPLE "

				echo -e "es correcto ? (y) [teclea ENTER ] : "
				echo -e ""
				read confirmacion

				if [ "$confirmacion" = "" ]

				then

		echo -e "$ingles : $SPANISH : $SOMETHINGELSE : $PAST : $PASTPARTICIPE : $GERUND : $EXAMPLE" >> $ENGLISH_DIRECTORY_PATH/$ingles.txt

		chmod 777 $SPANISH_DIRECTORY_PATH/$SPANISH.txt
		echo "" >> $SPANISH_DIRECTORY_PATH/$SPANISH.txt

		echo -e "$SPANISH : $ingles : $SOMETHINGELSE : $PAST : $PASTPARTICIPE : $GERUND : $EXAMPLE" >> $SPANISH_DIRECTORY_PATH/$SPANISH.txt					
		
		sed '/^ *$/d' $ENGLISH_DIRECTORY_PATH/$ingles.txt
		sed '/^ *$/d' $SPANISH_DIRECTORY_PATH/$SPANISH.txt
				
				else
					echo ""
				    echo	" $WHITE !!! confirmacion nula : no se agregara la palabra ¡¡¡ "
					
				fi
				;;      		     	
		
        "no") 	echo ""
			echo "dijiste NO";;
		"editar") 	echo ""
			vim $ENGLISH_DIRECTORY_PATH/$ingles.txt
			vim $SPANISH_DIRECTORY_PATH/$SPANISH.txt
			;;

		*) 	echo "oprime tecla correcta"
			echo "";;
		
		esac

	fi 
	else
		echo ""
	fi	
done
