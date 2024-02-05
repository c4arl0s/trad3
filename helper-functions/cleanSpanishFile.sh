#!/usr/bin/env bash

cleanSpanishFile()
{
    WORD=$1
    #borrar lineas vacias
    sed "/^ *$/d" ${SPANISH_DIRECTORY_PATH}/${WORD}.txt > ${COMODIN_DIRECTORY_PATH}/temporal.txt
    cat ${COMODIN_DIRECTORY_PATH}/temporal.txt > ${SPANISH_DIRECTORY_PATH}/${WORD}.txt
}
