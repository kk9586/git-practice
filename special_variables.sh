#!/bin/bash

echo "all vriables passed to the script : $@"
echo "number of variables passed to the script : $#"
echo "to know the name of a script : $0"
echo "to know current working directory : $pwd"
echo "to know home directory of current user : $home"
echo "to know PID of the script executing now : $$"
echo "to know PID of the last background command : $!"