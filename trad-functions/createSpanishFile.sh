#!/usr/bin/env bash

createSpanishFile()
{
    SPANISH=$1
    formattedSPANISH=$(echo $SPANISH | sed "y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜĀÁǍÀĒÉĚÈĪÍǏÌŌÓǑÒŪÚǓÙǕǗǙǛ/aaaaeeeeiiiioooouuuuüüüüAAAAEEEEIIIIOOOOUUUUÜÜÜÜ/")
    SPANISH=$formattedSPANISH
    touch $SPANISH_DIRECTORY_PATH/$SPANISH.txt
}
