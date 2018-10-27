#!/bin/bash
. /Users/Carlossantiagocruz/Documents/BASH-PROGRAMMING/DICT-EN-ES/funciones.sh
#at the front of your main script (after the #!/bin/bash) the dot (in bash) is the same as the include directive in c, you don't have to export the functions as the file will be included in the main script, dont miss the space betwwen the dot and the filename
## INICIA PROGRAMA PRINCIPAL ###
# mientras todos los parametros $* que le pones al script sea igual a vacio,, haz lo que hay acontinuacion.
while [ "$*" == "" ]
	do
		imprimir-titulo
		read palabra
		prueba-palabra-ingles $palabra
        if [ "$?" = 0 ]
		    then
                #=================================
                if [[ -z $palabra ]];
                then
                                echo "User pressed ENTER with no input text, i will reproduce last word found ...";
                                reproduce-audio $INGLES
                else
                    echo -e "$BLANCO existe $ROSA $palabra $BLANCO en base de datos ingles"
                    prueba-palabra-audio $palabra
                    if [ "$?" = 0 ]
                        then
                            reproduce-audio $palabra
                            sleep 1
                        else
                            echo -e "$AMARILLO audio no existe ... se buscara en google"
                            descargar-mp3-google $palabra
                            echo -e "$AMARILLO si existe ... convirtiendo en wav"
                            convierte-mp3-wav $palabra
                            echo -e "$AMARILLO reproduciendo audio"
                            reproduce-audio $palabra
                            sleep 1
                    fi
                    limpiar-archivo-ingles $palabra
                    clear
                    desplegar-traduccion-ingles $palabra
                fi
                #=================================
			else
                #=================================
                    echo -e "$ROSA $palabra $BLANCO no existe en base de datos ingles .... buscando en base espanol"
                    prueba-palabra-espanol $palabra
                    if [ "$?" = 0 ]
				        then
					    existe-archivo-en-espanol $palabra
                        clear
                        desplegar-traduccion-espanol $palabra
                        reproduce-audio $INGLES
				    else
				        buscar-palabra-en-google $palabra
                        sleep 1
					    prueba-palabra-audio $ingles
                        sleep 1
                            if [ "$?" = 0 ]
					            then
						            reproduce-audio $ingles
                                    sleep 1
					            else
					                descargar-audio-de-google $ingles
                                    sleep 1
                            fi
                        clear
                        despliega-opcion-agregar-palabra
					    read decision
					    despliega-menu-de-decision
			        fi
                #==================================
		fi
done
