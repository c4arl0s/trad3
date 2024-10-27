#!/usr/bin/env bash

create_spanish_file() 
{
  formattedSPANISH=$(echo ${SPANISH} | sed "y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜĀÁǍÀĒÉĚÈĪÍǏÌŌÓǑÒŪÚǓÙǕǗǙǛ/aaaaeeeeiiiioooouuuuüüüüAAAAEEEEIIIIOOOOUUUUÜÜÜÜ/")
  SPANISH=${formattedSPANISH}
  echo "echo ${SPANISH}"
  touch ${SPANISH_DIRECTORY_PATH}/${SPANISH}.txt
  chmod +x+w ${SPANISH_DIRECTORY_PATH}/${SPANISH}.txt
}
