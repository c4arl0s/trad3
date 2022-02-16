#!/bin/bash
# script para agregar una palabra nueva a nuestro diccionario de ingles.
# variables que definen una secuencia de caracteres correspondientes a una impresion en color
# con un beeb en cada transicion

. ./helper-functions/colors.sh
. ./helper-functions/directoryPaths.sh

directorio_ingles='~/Documents/DictEnEsScript/VOCABULARY/ENGLISH'
directorio_espanol='/Documents/DictEnEsScript/VOCABULARY/SPANISH'
directorio_comodin='/Documents/DictEnEsScript/VOCABULARY'

imprimir_titulo()
{
    echo ""
    echo -e "$GREEN 	DictEnEsScript	SCRIPT PARA AGREGAR PALABRAS INGLES-ESPANOL   $YELLOW  teclea Ctrl-Z salir "
    echo -e "$RED ingrese uno y solo una palabra en INGLES para ingresar a la base de datos: "
    echo -e "$WHITE " 
}

obtener_traduccion()
{
    echo -e "$YELLOW ingrese palabra uno y solo una en ESPANOL:" 
    echo -e " $ROSAFONDONEGRO "
    read espanol 
    echo "" 
    echo -e "$YELLOW ingrese algo extra acerca de tu palabra:"
    echo -e " $GREEN "
    read algomas 
    echo "" 
    echo -e "$YELLOW ingrese PASADO en caso de ser verbo:" 
    echo -e " $GREEN " 
    read p 
    echo "" 
    echo -e "$YELLOW ingrese PASASO PARTICIPIO en caso de ser verbo:" 
    echo -e " $GREEN " 
    read pp 
    echo "" 
    echo -e "$YELLOW ingrese GERUNDIO en caso de ser verbo:" 
    echo -e " $GREEN " 
    read gerundio 
    echo "" 
    echo -e "$YELLOW ingrese un ejemplo de la palabra a agregar:" 
    echo -e " $GREEN"
    read ejemplo
}

imprimir_traduccion_ingresada()
{
    echo -e " $WHITE ENGLISH :	$ROSAFONDONEGRO $ingles "
    echo -e " $WHITE SPANISH :     $ROSAFONDONEGRO $espanol "
    echo -e " $WHITE EXTRA :       $ROSAFONDONEGRO $algomas "
    echo -e " $WHITE PAST :        $ROSAFONDONEGRO $p "
    echo -e " $WHITE PAST PARTICIPE : $ROSAFONDONEGRO $pp "
    echo -e " $WHITE GERUND :      $ROSAFONDONEGRO   $gerundio "
    echo -e " $WHITE EXAMPLE : 	$ROSAFONDONEGRO   $ejemplo "
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
		echo -e "$GREEN"
      		echo "la palabra existe"
            echo -e "$WHITE"
            cat $directorio_ingles/$ingles.txt
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
				read espanol 

				echo "" 
				echo -e "$YELLOW ingrese algo extra acerca de tu palabra:" 
				echo -e " $WHITE " 
				read algomas 

				echo "" 
				echo -e "$YELLOW ingrese PASADO en caso de ser verbo:" 
				echo -e " $WHITE " 
				read p 

				echo "" 
				echo -e "$YELLOW ingrese PASASO PARTICIPIO en caso de ser verbo:" 
				echo -e " $WHITE " 
				read pp 

				echo "" 
				echo -e "$YELLOW ingrese GERUNDIO en caso de ser verbo:" 
				echo -e " $WHITE " 
				read gerundio 

				echo "" 
				echo -e "$YELLOW ingrese un ejemplo de la palabra a agregar:" 
				echo -e " $WHITE " 
				read ejemplo
	 
				echo "confirmacion de la palabra: "

                                echo -e " $WHITE "

                                echo -e " $WHITE ENGLISH :     $GREEN $ingles "
                                echo -e " $WHITE SPANISH :     $GREEN $espanol "
                                echo -e " $WHITE EXTRA :       $GREEN $algomas "
                                echo -e " $WHITE PAST :        $GREEN $p "
                                echo -e " $WHITE PAST PARTICIPE : $GREEN $pp "
                                echo -e " $WHITE GERUND :      $GREEN   $gerundio "
                                echo -e " $WHITE EXAMPLE :     $GREEN   $ejemplo "

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
				    echo	" $WHITE !!! confirmacion nula : no se agregara la palabra ¡¡¡ "
					
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
