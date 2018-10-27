#!/bin/bash
existe-archivo-en-espanol()
{
palabra=$1
echo ""
echo -e "$CYAN $palabra existe ..."
echo ""
limpiar-archivo-espanol $palabra
}

