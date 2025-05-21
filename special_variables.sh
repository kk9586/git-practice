#!/bin/bash

echo "all vriables passed to the script : $@"
echo "number of variables passed to the script : $#"
echo "to know the name of a script : $0"
echo "to know current working directory : $PWD"
echo "to know home directory of current user : $HOME"
echo "to know PID of the script executing now : $$"
sleep 100 &
echo "to know PID of the last background command : $!"