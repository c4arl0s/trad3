#!/bin/bash

prueba-palabra-audio()
{
palabra=$1
test -f $directorio_audio/$palabra.wav
}

