#!/usr/bin/env bash

saveSpanishTranslation()
{ 
    formattedSPANISH=$(echo $SPANISH | sed "y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜĀÁǍÀĒÉĚÈĪÍǏÌŌÓǑÒŪÚǓÙǕǗǙǛ/aaaaeeeeiiiioooouuuuüüüüAAAAEEEEIIIIOOOOUUUUÜÜÜÜ/")
    SPANISH=$formattedSPANISH
    echo -e "$SPANISH:$ENGLISH:$SOMETHINGELSE:$PAST:$PASTPARTICIPE:$GERUND:$EXAMPLE" >> $SPANISH_DIRECTORY_PATH/$SPANISH.txt
}
