#!/bin/bash
obtener-campos-espanol()
{
palabra=$1
i=$2
ESPANOL=`cat $directorio_espanol/$palabra.txt | tail -$i  | cut -f 1 -d ":"`
INGLES=`cat $directorio_espanol/$palabra.txt | tail -$i  | cut -f 2 -d ":"`
EXTRA=`cat $directorio_espanol/$palabra.txt | tail -$i  | cut -f 3 -d ":"`
P=`cat $directorio_espanol/$palabra.txt | tail -$i  | cut -f 4 -d ":"`
PP=`cat $directorio_espanol/$palabra.txt | tail -$i  | cut -f 5 -d ":"`
G=`cat $directorio_espanol/$palabra.txt | tail -$i  | cut -f 6 -d ":"`
E=`cat $directorio_espanol/$palabra.txt | tail -$i  | cut -f 7 -d ":"`
}
