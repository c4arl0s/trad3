#!/usr/bin/env bash

readInputs()
{
    echo -e "$YELLOW add a word in SPANISH:" 
    echo -e " $ROSAFONDONEGRO "
    read SPANISH
    echo "" 
    echo -e "$YELLOW add something extra about the word:"
    echo -e "$GREEN"
    read SOMETHINGELSE
    echo "" 
    echo -e "$YELLOW if word is a verb add PAST:" 
    echo -e "$GREEN" 
    read PAST
    echo "" 
    echo -e "$YELLOW if word is a verb add PAST PARTICIPE:" 
    echo -e "$GREEN" 
    read PASTPARTICIPE
    echo "" 
    echo -e "$YELLOW if word is a verb add GERUND:" 
    echo -e "$GREEN" 
    read GERUND
    echo "" 
    echo -e "$YELLOW add an example about Spanish word:" 
    echo -e "$GREEN"
    read EXAMPLE
}
