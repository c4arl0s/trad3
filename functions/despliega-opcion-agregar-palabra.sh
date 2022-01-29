#!/bin/bash

despliega-opcion-agregar-palabra()
{
echo -e "es satisfactoria la busqueda?"
echo -e "$BLANCO"
echo -e "---------------------------"
echo -e "$BLANCO $espanol : $ingles"
echo -e "---------------------------"
echo -e "$CYAN Deseas agregar la palabra $ROSA $palabra ?"
echo -e "$BLANCO Teclea yes para agregar."
echo -e "$BLANCO Teclea Enter decir NO y continuar buscando palabras."
echo -e "$BLANCO Teclea add3 para iniciar script"
echo -e "$AMARILLO"
play $directorio_audio/$ingles.wav
echo -e "$AMARILLO ============="
echo -e "$BLANCO yes/ENTER/add3"
echo -e "$AMARILLO ============="
echo ""
}


