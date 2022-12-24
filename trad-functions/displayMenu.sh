#!/usr/bin/env bash

displayMenu()
{
    case $decision in 
    "yes")  echo ""
            echo "Se agregara a palabra: ..."
            agregar-palabra $espanol $ingles ;;
    "no") 	echo ""
    		echo "dijiste NO" ;;
    "add3") ./add3.sh ;; 
    *) 	    echo "tecleaste ENTER"
    		echo "" 
            ;;
    esac
}

