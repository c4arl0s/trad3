#!/usr/bin/env bash

createSpanishFile() 
{
    formattedSPANISH=$(echo $SPANISH | sed "y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜĀÁǍÀĒÉĚÈĪÍǏÌŌÓǑÒŪÚǓÙǕǗǙǛ/aaaaeeeeiiiioooouuuuüüüüAAAAEEEEIIIIOOOOUUUUÜÜÜÜ/")
    SPANISH=$formattedSPANISH
    echo "echo $SPANISH"
    touch $SPANISH_DIRECTORY_PATH/$SPANISH.txt
    chmod +x+w $SPANISH_DIRECTORY_PATH/$SPANISH.txt
}
