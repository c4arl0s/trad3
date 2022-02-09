#!/bin/bash

prueba-existencia()
{
    palabra=$1
    test -f $directorio_ingles/$palabra.txt
    bandera=$?
    return $bandera
}





