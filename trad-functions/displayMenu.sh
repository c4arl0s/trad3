#!/usr/bin/env bash

displayMenu()
{
    case $decision in 
    "yes")   echo "Se agregara a palabra: ..."
             agregar-palabra $espanol $ingles ;;
    "no")    echo "dijiste NO" ;;
    "add3") ./add3.sh ;; 
    *) 	    echo "tecleaste ENTER";;
    esac
}

