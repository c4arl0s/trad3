#!/usr/bin/env bash

crear-archivo-espanol()
{
    formattedSPANISH=$(echo $espanol | sed "y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜĀÁǍÀĒÉĚÈĪÍǏÌŌÓǑÒŪÚǓÙǕǗǙǛ/aaaaeeeeiiiioooouuuuüüüüAAAAEEEEIIIIOOOOUUUUÜÜÜÜ/")
    espanol=$formattedSPANISH
    touch $SPANISH_DIRECTORY_PATH/$espanol.txt
}
