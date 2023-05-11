#!/usr/bin/env bash

existe-archivo-en-espanol()
{
    WORD=$1
    echo -e "$CYAN $WORD existe ..."
    limpiar-archivo-espanol $WORD
}

