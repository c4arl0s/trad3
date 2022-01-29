#!/bin/bash
obtener-campos-ingles()
{
    WORD=$1
    i=$2
    INGLES=`cat $directorio_ingles/$WORD.txt | tail -$i  | cut -f 1 -d ":"`
    ESPANOL=`cat $directorio_ingles/$WORD.txt | tail -$i  | cut -f 2 -d ":"`
    EXTRA=`cat $directorio_ingles/$WORD.txt | tail -$i  | cut -f 3 -d ":"`
    P=`cat $directorio_ingles/$WORD.txt | tail -$i  | cut -f 4 -d ":"`
    PP=`cat $directorio_ingles/$WORD.txt | tail -$i  | cut -f 5 -d ":"`
    G=`cat $directorio_ingles/$WORD.txt | tail -$i  | cut -f 6 -d ":"`
    E=`cat $directorio_ingles/$WORD.txt | tail -$i  | cut -f 7 -d ":"`
}
