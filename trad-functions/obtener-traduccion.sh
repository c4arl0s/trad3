#!/usr/bin/env bash

obtener-traduccion()
{ 
    traduccion=$1
    ingles=$2
    echo -e "${AMARILLO}...agregando palabra obtenida de internet:"
    echo -e " ${ROSAFONDONEGRO} "
    espanol=$traduccion
    ingles=$ingles
    echo -e "$ingles : $traduccion"
    echo -e "${AMARILLO}ingrese algo extra acerca de tu palabra:"
    echo -e " ${VERDE} "
    read algomas 
    echo -e "${AMARILLO}ingrese PASADO en caso de ser verbo:" 
    echo -e " ${VERDE} " 
    read p 
    echo -e "${AMARILLO}ingrese PASASO PARTICIPIO en caso de ser verbo:" 
    echo -e " ${VERDE} " 
    read pp 
    echo -e "${AMARILLO}ingrese GERUNDIO en caso de ser verbo:" 
    echo -e " ${VERDE} " 
    read gerundio 
    echo -e "${AMARILLO}ingrese un ejemplo de la palabra a agregar:" 
    echo -e " ${VERDE}"
    read ejemplo
}
