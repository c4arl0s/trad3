#!/usr/bin/env bash

save_verb() 
{
    if [[ $1 ]]
    then
        touch $ENGLISH_DIRECTORY_PATH/$PAST.txt
        echo -e "$PAST is past of $ENGLISH / $SPANISH : "
        echo -e "$PAST is past of $ENGLISH / $SPANISH : " >> $ENGLISH_DIRECTORY_PATH/$PAST.txt
        cat $ENGLISH_DIRECTORY_PATH/$PAST.txt
    else
        echo -e " - "    
    fi
    if [[ $2 ]]
    then      
        touch $ENGLISH_DIRECTORY_PATH/$PASTPARTICIPE.txt
        echo -e "$PASTPARTICIPE is past participe of $ENGLISH / $SPANISH : " 
        echo -e "$PASTPARTICIPE is past participe of $ENGLISH / $SPANISH : " >> $ENGLISH_DIRECTORY_PATH/$PASTPARTICIPE.txt
        cat $ENGLISH_DIRECTORY_PATH/$PASTPARTICIPE.txt
    else
        echo -e " - "    
    fi
    if [[ $3 ]]
    then
        touch $ENGLISH_DIRECTORY_PATH/$GERUND.txt
        echo -e "$GERUND is gerund of $ENGLISH / $SPANISH : " 
        echo -e "$GERUND is gerund of $ENGLISH / $SPANISH : " >> $ENGLISH_DIRECTORY_PATH/$GERUND.txt
        cat $ENGLISH_DIRECTORY_PATH/$GERUND.txt
    else
        echo -e " - "    
    fi
}
