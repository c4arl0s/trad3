#!/usr/bin/env bash

create_spanish_file()
{
  SPANISH=$1
  formattedSPANISH=$(echo ${SPANISH} | sed "y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜĀÁǍÀĒÉĚÈĪÍǏÌŌÓǑÒŪÚǓÙǕǗǙǛ/aaaaeeeeiiiioooouuuuüüüüAAAAEEEEIIIIOOOOUUUUÜÜÜÜ/")
  SPANISH=${formattedSPANISH}
  touch ${SPANISH_DIRECTORY_PATH}/${SPANISH}.txt
}
