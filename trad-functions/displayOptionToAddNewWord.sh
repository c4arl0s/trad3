#!/usr/bin/env bash

displayOptionToAddNewWord()
{
    echo -e "es satisfactoria la busqueda?"
    echo -e "$WHITE"
    echo -e "$WHITE $espanol : $ingles"
    echo -e ""
    echo -e "$CYAN Deseas agregar la palabra $PINK $WORD ?"
    echo -e "Teclea yes para agregar."
    echo -e "Teclea Enter decir NO y continuar buscando palabras."
    echo -e "Teclea add3 para iniciar script"
    echo -e "$YELLOW"
    play $AUDIO_DIRECTORY_PATH/$ingles.wav
    echo -e "$YELLOW ============="
    echo -e "type your choice [yes|ENTER|add3]"
    echo -e "$YELLOW ============="
    echo ""
}
