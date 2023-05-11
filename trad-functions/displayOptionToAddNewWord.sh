#!/usr/bin/env bash

displayOptionToAddNewWord()
{
    echo "$GREEN"
    echo -e "$WHITE"
    echo -e "$WHITE $espanol : $ingles"
    echo -e "$CYAN Do you want to add this word?$PINK $WORD?"
    echo -e "$WHITEType$CYAN yes$WHITEto add."
    echo -e "Type enter to ignore"
    echo -e "Type add3 to start script"
    echo -e "$YELLOW"
    play $AUDIO_DIRECTORY_PATH/$ingles.wav
    echo -e "$YELLOW"
    echo -e "type your choice [yes|add3], type enter to ignore"
    echo -e "$YELLOW"
}
