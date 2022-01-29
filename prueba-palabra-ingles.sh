#!/bin/bash

prueba-palabra-ingles()
{
palabra=$1
test -f $directorio_ingles/$palabra.txt   #prueba si el archivo existe
}

