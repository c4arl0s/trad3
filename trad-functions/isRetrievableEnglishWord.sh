#!/usr/bin/env bash

isRetrievableEnglishWord()
{
    WORD=$1
    test ! -f $ENGLISH_DIRECTORY_PATH/$WORD.txt
}

