#!/usr/bin/env bash

isRetrievableEnglishWord()
{
    WORD=$1
    # if WORD exist, returns 0
    test -f $ENGLISH_DIRECTORY_PATH/$WORD.txt
}

