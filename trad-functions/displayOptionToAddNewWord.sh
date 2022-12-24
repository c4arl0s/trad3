#!/usr/bin/env bash

displayOptionToAddNewWord()
{
    echo -e "es satisfactoria la busqueda?"
    echo -e "$WHITE"
    echo -e "---------------------------"
    echo -e "$WHITE $espanol : $ingles"
    echo -e "---------------------------"
    echo -e "$CYAN Deseas agregar la palabra $PINK $WORD ?"
    echo -e "$WHITE Teclea yes para agregar."
    echo -e "$WHITE Teclea Enter decir NO y continuar buscando palabras."
    echo -e "$WHITE Teclea add3 para iniciar script"
    echo -e "$YELLOW"
    play $AUDIO_DIRECTORY_PATH/$ingles.wav
    echo -e "$YELLOW ============="
    echo -e "$WHITE yes/ENTER/add3"
    echo -e "$YELLOW ============="
    echo ""
}
