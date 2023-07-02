#!/usr/bin/env bash

crear-archivo-espanol()
{
    formattedSPANISH=$(echo $SPANISH | sed "y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜĀÁǍÀĒÉĚÈĪÍǏÌŌÓǑÒŪÚǓÙǕǗǙǛ/aaaaeeeeiiiioooouuuuüüüüAAAAEEEEIIIIOOOOUUUUÜÜÜÜ/")
    SPANISH=$formattedSPANISH
    touch $SPANISH_DIRECTORY_PATH/$SPANISH.txt
}
