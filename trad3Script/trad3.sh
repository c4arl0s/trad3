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

$palabra=ninguna

directorio_ingles='/Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH'
directorio_espanol='/Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/SPANISH'
directorio_comodin='/Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY'
directorio_audio='/Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/WORDS-AUDIO'

################################ Declaracion de Funciones ###################################

imprimir_titulo()
{
    echo -e ""
	echo -e "$ROJO --------------------------------------------------------------------------------------------------------"
	echo -e "$BLANCO 	BUSCAR PALABRA: (ingresa palabra en español o inglés) " La ultima palabra buscada fue ... $palabra
	echo -e "$ROJO --------------------------------------------------------------------------------------------------------"   
}

prueba_existencia()
{
    palabra=$1
    test -f /Users/Carl/Documents/BASH-PROGRAMMING/DICT-EN-ES/VOCABULARY/ENGLISH/$palabra.txt
    bandera=$?
    return $bandera
}

limpiar_archivo_ingles()
{
palabra=$1
# sed '/^ *$/d' file
# Borra todas las lineas que esten vacias o que contengan espacios en blanco.
#  '*' Indica 0 o mas ocurrencias del caracter previo. 
#  '^ *$' Indica una linea que contiene cero o mas espacios. 
# Por lo tanto, esto borrara todas las lineas las cuales estan vacias o lineas con solo algunos espacios en blanco.
sed '/^ *$/d' $directorio_ingles/$palabra.txt > $directorio_comodin/comodin.txt
cat $directorio_comodin/comodin.txt > $directorio_ingles/$palabra.txt
}

limpiar_archivo_espanol()
{
palabra=$1
sed '/^ *$/d' $directorio_espanol/$palabra.txt > $directorio_comodin/comodin.txt
cat $directorio_comodin/comodin.txt > $directorio_espanol/$palabra.txt
}

obtener_campos_espanol()
{
    palabra=$1
    i=$2
    INGLES=`cat $directorio_espanol/$palabra.txt | tail -$i  | cut -f 1 -d ":"`
    ESPANOL=`cat $directorio_espanol/$palabra.txt | tail -$i  | cut -f 2 -d ":"`
    EXTRA=`cat $directorio_espanol/$palabra.txt | tail -$i  | cut -f 3 -d ":"`
    P=`cat $directorio_espanol/$palabra.txt | tail -$i  | cut -f 4 -d ":"`
    PP=`cat $directorio_espanol/$palabra.txt | tail -$i  | cut -f 5 -d ":"`
    G=`cat $directorio_espanol/$palabra.txt | tail -$i  | cut -f 6 -d ":"`
    E=`cat $directorio_espanol/$palabra.txt | tail -$i  | cut -f 7 -d ":"`
}

imprimir_campos_espanol()
{
    echo -e "$BLANCO"
    echo -e "$INGLES --> $ROSAFONDONEGRO $ESPANOL"
    echo -e ""
    echo -e "$BLANCO Extra: $VERDE $EXTRA"
    echo -e "$BLANCO Past: $VERDE $P" 
    echo -e "$BLANCO Past Participe: $VERDE $PP"
    echo -e "$BLANCO Gerund: $VERDE $G"
    echo -e "$BLANCO Example: $VERDE $E"            
}

obtener_campos_ingles()
{
    palabra=$1
    i=$2
    INGLES=`cat $directorio_ingles/$palabra.txt | tail -$i  | cut -f 1 -d ":"`
    ESPANOL=`cat $directorio_ingles/$palabra.txt | tail -$i  | cut -f 2 -d ":"`
    EXTRA=`cat $directorio_ingles/$palabra.txt | tail -$i  | cut -f 3 -d ":"`
    P=`cat $directorio_ingles/$palabra.txt | tail -$i  | cut -f 4 -d ":"`
    PP=`cat $directorio_ingles/$palabra.txt | tail -$i  | cut -f 5 -d ":"`
    G=`cat $directorio_ingles/$palabra.txt | tail -$i  | cut -f 6 -d ":"`
    E=`cat $directorio_ingles/$palabra.txt | tail -$i  | cut -f 7 -d ":"`
}

imprimir_campos_ingles()
{
echo -e "$BLANCO"
echo -e "$INGLES --> $ROSAFONDONEGRO $ESPANOL"
echo -e ""
        if [ -z "$EXTRA" ];
        then    
            echo -e "$BLANCO Extra: $VERDE $EXTRA"
        fi
        if [ -n "$P" ];
        then    
            echo -e "$BLANCO Past: $VERDE $P" 
        fi
        if [ -n "$PP" ]
        then
            echo -e "$BLANCO Past Participe: $VERDE $PP"
        fi
        if [ -n "$G" ]
        then
            echo -e "$BLANCO Gerund: $VERDE $G"
        fi
        if [ -n "$E" ]
        then
            echo -e "$BLANCO Ejemplo: $E"
        fi
}

desplegar_traduccion_ingles()
{
        n=$(cuenta_lineas_archivo_ingles $palabra)
		
		echo -e " tiene $n numeros de lineas el archivo $palabra.txt"	
		echo ""

        # INICIA UN FOR
		for i in `seq $n`	# hace una accion desde i hasta n
		
		#for i in $n     # hace una accion desde i hasta n

		do
            obtener_campos_ingles $palabra $i
            imprimir_campos_ingles
		done
}

desplegar_traduccion_espanol()
{
    n=$(cuenta_lineas_archivo_espanol $palabra)
    echo -e " tiene $n numeros de lineas el archivo $palabra.txt"
    echo ""
    for i in `seq $n`       # hace una accion desde i hasta n
                            #for i in $n     # hace una accion desde i hasta n
    do
        obtener_campos_espanol $palabra $i
        imprimir_campos_espanol
    done
}

cuenta_lineas_archivo_espanol()
{ 
palabra=$1
cat $directorio_espanol/$palabra.txt | wc -l | cut -f 8 -d " "
}

cuenta_lineas_archivo_ingles()
{
cat $directorio_ingles/$palabra.txt | wc -l | cut -f 8 -d " "
}

descarga_mp3_google()
{
wget -P $directorio_audio https://ssl.gstatic.com/dictionary/static/sounds/de/0/$palabra.mp3 
}

convierte_mp3_wav()
{
ffmpeg -i $directorio_audio/$palabra.mp3 $directorio_audio/$palabra.wav
}

################################### INICIA PROGRAMA PRINCIPAL ######################################################

while ["$*" != ""] 
# mientras todos los parametros $* que le pones al script sea diferente de nada, haz lo que hay acontinuacion.
do
    imprimir_titulo
    echo -e "$BLANCO"
    read palabra
    test -f $directorio_ingles/$palabra.txt

    if [ "$?" = 0 ]	        

	then	
        echo ""	
		echo -e "$CYAN $palabra existe ..."
		echo ""
        limpiar_archivo_ingles $palabra
        desplegar_traduccion_ingles

        test -f $directorio_audio/$palabra.wav
        
        if [ "$?" = 0 ]
        then
            play $directorio_audio/$palabra.wav
        else
            descarga_mp3_google
            convierte_mp3_wav
            play $directorio_audio/$palabra.wav
        fi
	else
		test -f $directorio_espanol/$palabra.txt	
	
		if [ "$?" = 0 ]
        then
            echo ""
            echo -e "$CYAN $palabra existe ..."
            echo ""
            limpiar_archivo_espanol $palabra
            desplegar_traduccion_espanol
            play $directorio_audio/$ingles.wav
		else
			echo ""
			echo -e "$AMARILLO $palabra no existe en la base de datos!, deseas agregar la palabra ?: "
            echo -e ""
            echo -e "$CYAN intentaré reproducir el audio ... "
            test -f $directorio_audio/$palabra.wav
                    if [ "$?" = 0 ]
                    then 
                        play $directorio_audio/$palabra.wav
                    else
                        echo -e ""
                        echo -e "intentaré descargar la palabra de google ..."
                        descarga_mp3_google
                        convierte_mp3_wav
                        play $directorio_audio/$palabra.wav
                    fi
            
            echo -e "$BLANCO Deseas agregar la palabra ? (yes/no)"    
			echo -e "teclea ENTER si deseas seguir traduciendo."
            echo ""

            read decision

            case $decision in 

                "yes")  echo "se agregara a palabra: ..."
                        /usr/local/bin/add3 ;;
                    
		        "no") 	echo ""
			            echo "dijiste NO" ;;

		        *) 	echo "tecleaste ENTER"
			        echo "" 
                     ;;
		esac

		fi
	fi
done
