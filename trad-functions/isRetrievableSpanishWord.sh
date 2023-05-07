#!/usr/bin/env bash

isRetrievableSpanishWord()
{
    WORD=$1
    # If SPANISH exist, returns 0
    test -f $SPANISH_DIRECTORY_PATH/$WORD.txt
}
