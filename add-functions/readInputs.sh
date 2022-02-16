#!/bin/bash

readInputs()
{
    echo -e "$YELLOW add a word in SPANISHL:" 
    echo -e " $ROSAFONDONEGRO "
    read spanish 
    echo "" 
    echo -e "$YELLOW add something extra about the word:"
    echo -e " $GREEN "
    read somethingelse 
    echo "" 
    echo -e "$YELLOW if word is a verb add PAST:" 
    echo -e " $GREEN " 
    read PAST
    echo "" 
    echo -e "$YELLOW if word is a verb add PAST PARTICIPE:" 
    echo -e " $GREEN " 
    read PASTPARTICIPE
    echo "" 
    echo -e "$YELLOW if word is a verb add GERUND:" 
    echo -e " $GREEN " 
    read GERUND
    echo "" 
    echo -e "$YELLOW add an example about Spanish word:" 
    echo -e " $GREEN"
    read EXAMPLE
}
