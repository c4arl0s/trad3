#!/bin/bash

getEnglishFields()
{
    WORD=$1
    ROW=$2
    INGLES=`cat $ENGLISH_DIRECTORY_PATH/$WORD.txt | tail -$ROW | cut -f 1 -d ":"`
    ESPANOL=`cat $ENGLISH_DIRECTORY_PATH/$WORD.txt | tail -$ROW | cut -f 2 -d ":"`
    EXTRA=`cat $ENGLISH_DIRECTORY_PATH/$WORD.txt | tail -$ROW | cut -f 3 -d ":"`
    P=`cat $ENGLISH_DIRECTORY_PATH/$WORD.txt | tail -$ROW | cut -f 4 -d ":"`
    PP=`cat $ENGLISH_DIRECTORY_PATH/$WORD.txt | tail -$ROW | cut -f 5 -d ":"`
    G=`cat $ENGLISH_DIRECTORY_PATH/$WORD.txt | tail -$ROW | cut -f 6 -d ":"`
    E=`cat $ENGLISH_DIRECTORY_PATH/$WORD.txt | tail -$ROW | cut -f 7 -d ":"`
}
