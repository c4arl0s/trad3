
processVerb() 
{
    if [ "$PAST" = "" ]
    then
        echo -e " - "    
    else
        touch $ENGLISH_DIRECTORY_PATH/$PAST.txt
        echo -e "$PAST es el pasado de $ENGLISH / $SPANISH : " >> $ENGLISH_DIRECTORY_PATH/$PAST.txt
    fi
    if [ "$PASTPARTICIPE" = "" ]
    then      
        echo -e " - "    
    else
       touch $ENGLISH_DIRECTORY_PATH/$PASTPARTICIPE.txt
       echo -e "$PASTPARTICIPE es el pasado participio de $ENGLISH / $SPANISH : " >> $ENGLISH_DIRECTORY_PATH/$PASTPARTICIPE.txt
    fi
    if [ "$GERUND" = "" ]
    then
        echo -e " - "    
    else
        touch $ENGLISH_DIRECTORY_PATH/$GERUND.txt
        echo -e "$GERUND es el gerundio de $ENGLISH / $SPANISH : " >> $ENGLISH_DIRECTORY_PATH/$GERUND.txt
    fi
}
