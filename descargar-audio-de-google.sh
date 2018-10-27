#!/bin/bash
descargar-audio-de-google()
{
palabra=$1
echo -e ""
echo -e "intentaré descargar la palabra de google ..."
echo -e "$BLANCO"
descarga_mp3_google $palabra
convierte_mp3_wav $palabra
play $directorio_audio/$palabra.wav
echo ""
echo -e "... se descargo de internet $AMARILLO $palabra"
clear
}


