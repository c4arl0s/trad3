#!/bin/bash

convierte-mp3-wav()
{
palabra=$1
ffmpeg -i $directorio_audio/$palabra.mp3 $directorio_audio/$palabra.wav
}

