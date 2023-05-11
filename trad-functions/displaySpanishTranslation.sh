#!/usr/bin/env bash

displaySpanishTranslation()
{
    SPANISH_WORD=$1
    ROWS=`countLinesSpanishFile $SPANISH_WORD`
    echo -e "$WORD file has $ROWS rows"
    for ROW in `seq $ROWS`
    do
        getSpanishFields $WORD $ROW
        printSpanishFields
    done
}
