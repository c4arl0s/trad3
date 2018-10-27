#!/bin/bash

despliega-menu-de-decision()
{
case $decision in 
"yes")  echo ""
        echo "Se agregara a palabra: ..."
        #/usr/local/bin/add3 
        agregar-palabra $espanol $ingles ;;
"no") 	echo ""
		echo "dijiste NO" ;;
"add3") /usr/local/bin/add3;; 
*) 	    echo "tecleaste ENTER"
		echo "" 
        ;;
esac
}

