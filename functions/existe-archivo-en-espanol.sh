#!/bin/bash

existe-archivo-en-espanol()
{
    WORD=$1
    echo ""
    echo -e "$CYAN $WORD existe ..."
    echo ""
    limpiar-archivo-espanol $WORD
}

