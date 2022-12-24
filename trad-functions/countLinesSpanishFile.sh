#!/usr/bin/env bash

countLinesSpanishFile()
{ 
    WORD=$1
    cat $SPANISH_DIRECTORY_PATH/$WORD.txt | wc -l | cut -f 8 -d " "
}
