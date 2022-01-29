#!/bin/bash

getEnglishFields()
{
    WORD=$1
    ROW=$2
    INGLES=`cat $ENGLISHDIRECTORY_PATH/$WORD.txt | tail -$ROW | cut -f 1 -d ":"`
    ESPANOL=`cat $ENGLISHDIRECTORY_PATH/$WORD.txt | tail -$ROW | cut -f 2 -d ":"`
    EXTRA=`cat $ENGLISHDIRECTORY_PATH/$WORD.txt | tail -$ROW | cut -f 3 -d ":"`
    P=`cat $ENGLISHDIRECTORY_PATH/$WORD.txt | tail -$ROW | cut -f 4 -d ":"`
    PP=`cat $ENGLISHDIRECTORY_PATH/$WORD.txt | tail -$ROW | cut -f 5 -d ":"`
    G=`cat $ENGLISHDIRECTORY_PATH/$WORD.txt | tail -$ROW | cut -f 6 -d ":"`
    E=`cat $ENGLISHDIRECTORY_PATH/$WORD.txt | tail -$ROW | cut -f 7 -d ":"`
}
