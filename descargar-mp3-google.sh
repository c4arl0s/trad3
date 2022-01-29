#!/bin/bash
descargar-mp3-google()
{
palabra=$1
directorio_de_descargas='https://ssl.gstatic.com/dictionary/static/sounds/de/0'
wget -P $directorio_audio $directorio_de_descargas/$palabra.mp3
}
