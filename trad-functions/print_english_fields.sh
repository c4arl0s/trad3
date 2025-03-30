#!/usr/bin/env bash

print_english_fields() {
    # Imprimir siempre la traducción principal
    echo -e "${WHITE}$ENGLISH:${PINK} ${SPANISH}"
    
    # Imprimir solo las variables que no estén vacías
    [[ -n "${EXTRA}" ]] && echo -e "${WHITE}Extra:${GREEN} ${EXTRA}"
    [[ -n "${P}" ]] && echo -e "${WHITE}Past:${GREEN} ${P}"
    [[ -n "${PP}" ]] && echo -e "${WHITE}Past Participe:${GREEN} ${PP}"
    [[ -n "${G}" ]] && echo -e "${WHITE}Gerund:${GREEN} ${G}"
    [[ -n "${E}" ]] && echo -e "${WHITE}Example:${GREEN} ${E}"
}