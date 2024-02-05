#!/usr/bin/env bash

getSpanishFields()
{
    WORD=$1
    ROW=$2
    ESPANOL=`cat ${SPANISH_DIRECTORY_PATH}/${WORD}.txt | tail -${ROW} | cut -f 1 -d ":"`
    INGLES=`cat ${SPANISH_DIRECTORY_PATH}/${WORD}.txt | tail -${ROW} | cut -f 2 -d ":"`
    EXTRA=`cat ${SPANISH_DIRECTORY_PATH}/${WORD}.txt | tail -${ROW} | cut -f 3 -d ":"`
    P=`cat ${SPANISH_DIRECTORY_PATH}/${WORD}.txt | tail -${ROW} | cut -f 4 -d ":"`
    PP=`cat ${SPANISH_DIRECTORY_PATH}/${WORD}.txt | tail -${ROW} | cut -f 5 -d ":"`
    G=`cat ${SPANISH_DIRECTORY_PATH}/${WORD}.txt | tail -${ROW} | cut -f 6 -d ":"`
    E=`cat ${SPANISH_DIRECTORY_PATH}/${WORD}.txt | tail -${ROW} | cut -f 7 -d ":"`
}
