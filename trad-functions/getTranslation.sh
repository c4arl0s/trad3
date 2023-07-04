#!/usr/bin/env bash

getTranslation()
{ 
    TRANSLATION=$1
    ENGLISH=$2
    echo -e "${AMARILLO}...adding $TRANSLATION:"
    SPANISH=$TRANSLATION
    ENGLISH=$ENGLISH
    echo -e "$ENGLISH : $TRANSLATION"
    echo -e "${WHITE}Type something extra about your word:${CYAN}"
    read algomas 
    echo -e "${WHITE}Type PAST in case is a verb:${CYAN}" 
    read p 
    echo -e "${WHITE}Type PAST PARTICIPE in case is a verb:${CYAN}" 
    read pp 
    echo -e "${WHITE}Type GERUND in case is a verb:${CYAN}" 
    read gerundio 
    echo -e "${WHITE}Type an example about your word:${CYAN}" 
    read ejemplo
}
