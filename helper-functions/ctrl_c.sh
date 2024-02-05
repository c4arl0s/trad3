#!/usr/bin/env bash

# initialise trap to call trap_ctrlc function
# when signal 2 (SIGINT) is received
trap trap_ctrlc 2

# this function is called when Ctrl-C is sent
function trap_ctrlc ()
{
    # perform cleanup here
    echo "Ctrl-C caught...performing clean up"
 
    echo "Doing cleanup"
 
    # exit shell script with error code 2
    # if omitted, shell script will continue execution
    exit 2
}
