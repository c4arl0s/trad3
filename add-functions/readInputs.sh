#!/usr/bin/env bash

readInputs()
{
    printf "%s" "Add a word in SPANISH: "; read SPANISH
    printf "%s" "Add something extra about the word: "; read SOMETHINGELSE
    printf "%s" "If word is a verb add PAST: "; read PAST
    printf "%s" "If word is a verb add PAST PARTICIPE: "; read PASTPARTICIPE
    printf "%s" "If word is a verb add GERUND: "; read GERUND
    printf "%s" "Add an example about Spanish word: "; read EXAMPLE
}
