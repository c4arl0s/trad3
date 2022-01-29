#!/bin/bash

imprimir-traduccion-ingresada()
{
echo -e "$AMARILLO ================="
echo -e "$AMARILLO Datos ingresados:"
echo -e "$AMARILLO ================="
echo -e "$BLANCO ENGLISH : $ROSAFONDONEGRO $ingles "
echo -e "$BLANCO SPANISH : $ROSAFONDONEGRO $espanol "
echo -e "$BLANCO extra : $ROSAFONDONEGRO $algomas "
echo -e "$BLANCO past : $ROSAFONDONEGRO $p "
echo -e "$BLANCO past participe : $ROSAFONDONEGRO $pp "
echo -e "$BLANCO gerund : $ROSAFONDONEGRO $gerundio "
echo -e "$BLANCO example : $ROSAFONDONEGRO $ejemplo "
play $directorio_audio/$ingles.wav
echo -e "$BLANCO"
}
