#!/bin/bash

displaySpanishTranslation()
{
    WORD=$1
    ROWS=`countLinesSpanishFile $WORD`
    echo -e "$WORD file has $ROWS rows"
    echo ""
    for ROW in `seq $ROWS`
    do
        getSpanishFields $WORD $ROW
        printSpanishFields
    done
}
